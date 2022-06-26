class DirectDebitPaymentTransaction < ApplicationRecord
  belongs_to :direct_debit_payment, foreign_key: :payment_id
  validates_presence_of :name, :bic, :iban, :amount, :mandate_date_of_signature, :local_instrument, :sequence_type, :mandate_id

  validates_length_of :iban,  maximum: 34, allow_blank: false
  validates_length_of :bic,  maximum: 11, allow_blank: false
  validates_length_of :name,  maximum: 70, allow_blank: false
  validates_length_of :currency,  maximum: 3, allow_blank: false
  validates_length_of :mandate_id,  maximum: 35, allow_blank: false
  validates_with SEPA::IBANValidator, field_name: :iban
  validates_with SEPA::BICValidator, field_name: :bic
  enum local_instrument: {
    "CORE": 0,
    "COR1": 1,
    "B2B": 2
  }
  enum sequence_type: {
    "FRST": 0,
    "RCUR": 1,
    "OOFF": 2,
    "FNAL": 3
  }
  validates_inclusion_of :local_instrument, in: local_instruments.keys
  validates_inclusion_of :sequence_type, in: sequence_types.keys
end
