class CreateDirectDebitPaymentTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :direct_debit_payment_transactions do |t|
      t.string :name, limit: 70, null: false
      t.string :bic, limit: 11, null: false
      t.string :iban, limit: 34, null: false
      t.decimal :amount, null: false
      t.string :currency, limit: 3, null: false, default: 'EUR'
      t.string :instruction, limit: 35
      t.string :reference, limit: 35
      t.string :remittance_information, limit: 140
      t.string :mandate_id, limit: 35
      t.date :mandate_date_of_signature, null: false
      t.integer :local_instrument, null: false
      t.integer :sequence_type, null: false
      t.date :requested_date
      t.boolean :batch_booking, null: false, default: false
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
