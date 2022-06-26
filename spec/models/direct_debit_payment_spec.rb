require 'rails_helper'

RSpec.describe DirectDebitPayment, type: :model do
  describe "it" do
    subject { build(:direct_debit_payment) }
    it "should have blank type before create" do
      expect(subject.type).to eq("")
    end
    it "should have DirectDebitPayment type after create" do
      subject.save
      expect(subject.type).to eq("DirectDebitPayment")
    end
  end
end
