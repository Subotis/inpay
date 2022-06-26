class CreditTransferPaymentTransaction < ApplicationRecord
  belongs_to :credit_transfer_payment, foreign_key: :payment_id
  validates_presence_of :name, :bic, :iban, :amount

  validates_length_of :iban,  maximum: 34, allow_blank: false
  validates_length_of :bic,  maximum: 11, allow_blank: false
  validates_length_of :name,  maximum: 70, allow_blank: false
  validates_length_of :currency,  maximum: 3, allow_blank: false
  validates_with SEPA::IBANValidator, field_name: :iban
  validates_with SEPA::BICValidator, field_name: :bic
  enum service_level: {
    "SEPA": 0,
    "URGP": 1,
  }
  validates_inclusion_of :service_level, in: service_levels.keys
end
