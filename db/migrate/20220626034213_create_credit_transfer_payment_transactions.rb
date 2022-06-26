class CreateCreditTransferPaymentTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_transfer_payment_transactions do |t|
      t.string :name, limit: 70, null: false
      t.string :bic, limit: 11, null: false
      t.string :iban, limit: 34, null: false
      t.decimal :amount, null: false
      t.string :currency, limit: 3, null: false, default: 'EUR'
      t.string :instruction, limit: 35
      t.string :reference, limit: 35
      t.string :remittance_information, limit: 140
      t.date :requested_date
      t.boolean :batch_booking, null: false, default: false
      t.integer :service_level
      t.string :category_purpose
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
