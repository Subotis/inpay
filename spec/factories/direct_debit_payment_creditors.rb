FactoryBot.define do
  factory :direct_debit_payment_creditor do
    name { Faker::Company.name }
    bic { Faker::Bank.swift_bic }
    iban { Faker::Bank.iban }
    creditor_identifier { "MyString" }
    association :payment
    trait :nonbic do
      bic {'test'}
    end
    trait :noniban do
      iban {'test'}
    end
  end
end
