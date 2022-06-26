require 'rails_helper'

RSpec.describe CreditTransferPaymentTransaction, type: :model do
  describe "validate presence" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bic) }
    it { should validate_presence_of(:iban) }
    it { should validate_presence_of(:amount) }
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
    subject { build(:credit_transfer_payment_transaction) }
    it { should be_valid }
  end
  describe "non bic" do
    subject { build(:credit_transfer_payment_transaction, :nonbic) }
    it { should be_invalid }
  end
  describe "non iban" do
    subject { build(:credit_transfer_payment_transaction, :noniban) }
    it { should be_invalid }
  end
  it { should define_enum_for(:service_level).with_values({"SEPA": 0, "URGP": 1}) }
  describe "service_level should be in [SEPA, URGP]" do
    subject { build(:credit_transfer_payment_transaction) }
    it { should be_valid }
  end
  describe "belong to payment" do
    it { should belong_to (:credit_transfer_payment) }
  end
end
