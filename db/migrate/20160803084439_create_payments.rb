class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.text :description
      t.integer :amount
      t.datetime :date
      t.integer :contract_id

      t.timestamps null: false
    end
  end
end
