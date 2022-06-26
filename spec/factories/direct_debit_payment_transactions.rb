FactoryBot.define do
  factory :direct_debit_payment_transaction do
    name { Faker::Company.name }
    bic { Faker::Bank.swift_bic }
    iban { Faker::Bank.iban }
    amount { "9.99" }
    currency { "GBP" }
    instruction { "MyString" }
    reference { "MyString" }
    remittance_information { "MyString" }
    mandate_id { "MyString" }
    mandate_date_of_signature { "2022-06-26" }
    local_instrument { "B2B" }
    sequence_type { 'FNAL' }
    requested_date { "2022-06-26" }
    batch_booking { false }
    association :direct_debit_payment
    trait :nonbic do
      bic {'test'}
    end
    trait :noniban do
      iban {'test'}
    end
  end
end
