class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.string :title
      t.decimal :amount, null: false
      t.integer :term, default: 6, null: false
      t.integer :period, default: 1, null: false
      t.integer :year_rate, default: 30, null: false
      t.integer :expiration_rate, default: 50, null: false

      t.timestamps
    end
  end
end
