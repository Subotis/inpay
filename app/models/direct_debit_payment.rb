class DirectDebitPayment < Payment
  # refactor - to move into concern
  has_one :direct_debit_payment_creditor, foreign_key: 'payment_id'
  has_many :direct_debit_payment_transactions, foreign_key: 'payment_id'
  validates_associated :direct_debit_payment_creditor, :message=> lambda{|class_obj, obj| obj[:value].errors.full_messages.join(",") }
  validates_associated :direct_debit_payment_transactions, :message=> lambda{|class_obj, obj| obj[:value].map {|e| e.errors.full_messages.join(",")} }
  before_create :set_type
  after_save :generate_pain, if: :check

  private
  def check
    self.direct_debit_payment_transactions.count > 0
  end
  def set_type
    self.type="DirectDebitPayment"
  end
  def generate_pain
    sdd = SEPA::DirectDebit.new(
      name: self.direct_debit_payment_creditor.name,
      bic: self.direct_debit_payment_creditor.bic,
      iban: self.direct_debit_payment_creditor.iban,
      creditor_identifier: self.direct_debit_payment_creditor.creditor_identifier
    )
    self.direct_debit_payment_transactions.each do |t|
      sdd.add_transaction(
          name: t.name,
          bic: t.bic,
          iban: t.iban,
          amount: t.amount,
          currency: t.currency,
          instruction: t.instruction,
          reference: t.reference,
          remittance_information: t.remittance_information,
          mandate_id: t.mandate_id,
          mandate_date_of_signature: t.mandate_date_of_signature,
          local_instrument: t.local_instrument,
          sequence_type: t.sequence_type,
          requested_date: t.requested_date,
          batch_booking: t.batch_booking
      )
      self.update_column(:xml, sdd.to_xml)
    end
  end
end
