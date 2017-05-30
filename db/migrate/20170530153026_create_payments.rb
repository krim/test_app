class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :loan, foreign_key: true
      t.integer :month, null: false
      t.boolean :expiration, default: false, null: false
      t.boolean :last_payment, default: false, null: false

      t.timestamps
    end
  end
end
