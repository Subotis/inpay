class CreateCreditTransferPaymentDebtors < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_transfer_payment_debtors do |t|
      t.string :name, limit: 70, null: false
      t.string :bic, limit: 11, null: false
      t.string :iban, limit: 34, null: false
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
