require 'rails_helper'

RSpec.describe CreditTransferPaymentDebtor, type: :model do
  describe "validate presence" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bic) }
    it { should validate_presence_of(:iban) }
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
  describe "valid record" do
    subject { build(:credit_transfer_payment_debtor) }
    it { should be_valid }
  end
  describe "non bic" do
    subject { build(:credit_transfer_payment_debtor, :nonbic) }
    it { should be_invalid }
  end
  describe "non iban" do
    subject { build(:credit_transfer_payment_debtor, :noniban) }
    it { should be_invalid }
  end
  describe "belong to payment" do
    it { should belong_to (:payment) }
  end
end
