class DirectDebitPaymentCreditor < ApplicationRecord
  belongs_to :payment, foreign_key: "payment_id"
  validates_presence_of :iban, :bic, :name, :creditor_identifier
  validates_length_of :iban,  maximum: 34, allow_blank: false
  validates_length_of :bic,  maximum: 11, allow_blank: false
  validates_length_of :name,  maximum: 70, allow_blank: false
  validates_length_of :creditor_identifier, maximum: 35, allow_blank: false
  validates_with SEPA::IBANValidator, field_name: :iban
  validates_with SEPA::BICValidator, field_name: :bic
end
