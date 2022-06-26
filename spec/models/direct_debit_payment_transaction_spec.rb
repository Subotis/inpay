require 'rails_helper'

RSpec.describe DirectDebitPaymentTransaction, type: :model do
  describe "validate presence" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bic) }
    it { should validate_presence_of(:iban) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:mandate_date_of_signature) }
    it { should validate_presence_of(:local_instrument) }
    it { should validate_presence_of(:sequence_type) }
  end
  describe 'validate length of name' do
    it { should validate_length_of(:name).is_at_most(70) }
  end
  describe 'validate length of iban' do
    it { should validate_length_of(:iban).is_at_most(34) }
  end
  describe 'validate length of bic' do
    it { should validate_length_of(:bic).is_at_most(11) }
  end
  describe 'validate length of currency' do
    it { should validate_length_of(:currency).is_at_most(3) }
  end
  describe "valid record" do
    subject { build(:direct_debit_payment_transaction) }
    it { should be_valid }
  end
  describe "non bic" do
    subject { build(:direct_debit_payment_transaction, :nonbic) }
    it { should be_invalid }
  end
  describe "non iban" do
    subject { build(:direct_debit_payment_transaction, :noniban) }
    it { should be_invalid }
  end
  it { should define_enum_for(:local_instrument).with_values({"CORE": 0, "COR1": 1, "B2B": 2}) }
  describe "local_instrument should be in [CORE, COR1, B2B]" do
    subject { build(:direct_debit_payment_transaction) }
    it { should be_valid }
  end
  it { should define_enum_for(:sequence_type).with_values({"FRST": 0, "RCUR": 1, "OOFF": 2, "FNAL": 3 }) }
  describe "local_instrument should be in [FRST, RCUR, OOFF, FNAL]" do
    subject { build(:direct_debit_payment_transaction) }
    it { should be_valid }
  end
  describe "belong to payment" do
    it { should belong_to (:direct_debit_payment) }
  end
end
