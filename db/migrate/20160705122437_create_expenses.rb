class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.text :description
      t.integer :amount
      t.datetime :date
      t.integer :contract_id

      t.timestamps null: false
    end
  end
end
