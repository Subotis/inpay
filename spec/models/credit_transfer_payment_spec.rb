require 'rails_helper'

RSpec.describe CreditTransferPayment, type: :model do
  describe "it" do
    subject { build(:credit_transfer_payment) }
    it "should have blank type before create" do
      expect(subject.type).to eq("")
    end
    it "should have CreditTransferPayment type after create" do
      subject.save
      expect(subject.type).to eq("CreditTransferPayment")
    end
  end
end
