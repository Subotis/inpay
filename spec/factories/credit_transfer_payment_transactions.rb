FactoryBot.define do
  factory :credit_transfer_payment_transaction do
    name { Faker::Company.name }
    bic { Faker::Bank.swift_bic }
    iban { Faker::Bank.iban }
    amount { "9.99" }
    currency { "GBP" }
    instruction { "MyString" }
    reference { "MyString" }
    remittance_information { "MyString" }
    requested_date { "2022-06-26" }
    batch_booking { false }
    service_level { "URGP" }
    category_purpose { "SALA" }
    association :credit_transfer_payment
    trait :nonbic do
      bic {'test'}
    end
    trait :noniban do
      iban {'test'}
    end
  end
end
