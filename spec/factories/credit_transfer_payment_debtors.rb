FactoryBot.define do
  factory :credit_transfer_payment_debtor do
    name { Faker::Company.name }
    bic { Faker::Bank.swift_bic }
    iban { Faker::Bank.iban }
    association :payment
    trait :nonbic do
      bic {'test'}
    end
    trait :noniban do
      iban {'test'}
    end
  end
end
