class CreditTransferPaymentDebtor < ApplicationRecord
  belongs_to :payment
  validates_presence_of :iban, :bic, :name
  validates_length_of :iban,  maximum: 34, allow_blank: false
  validates_length_of :bic,  maximum: 11, allow_blank: false
  validates_length_of :name,  maximum: 70, allow_blank: false
  validates_with SEPA::IBANValidator, field_name: :iban
  validates_with SEPA::BICValidator, field_name: :bic
end
