class CreditTransferPayment < Payment
  has_one :credit_transfer_payment_debtor, foreign_key: 'payment_id'
  has_many :credit_transfer_payment_transactions, foreign_key: 'payment_id'
  before_create :set_type
  validates_associated :credit_transfer_payment_debtor, :message=> lambda{|class_obj, obj| obj[:value].errors.full_messages.join(",") }
  validates_associated :credit_transfer_payment_transactions
  after_create :generate_pain

  private
  def set_type
    self.type="CreditTransferPayment"
  end
  def generate_pain

  end
end
