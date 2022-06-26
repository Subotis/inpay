class CreateDirectDebitPaymentCreditors < ActiveRecord::Migration[7.0]
  def change
    create_table :direct_debit_payment_creditors do |t|
      t.string :name, limit: 70, null: false
      t.string :bic, limit: 11, null: false
      t.string :iban, limit: 34, null: false
      t.string :creditor_identifier, limit: 35, null: false
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
