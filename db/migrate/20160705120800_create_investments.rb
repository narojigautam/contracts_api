class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.datetime :date
      t.integer :amount
      t.string :description
      t.integer :investor_id

      t.timestamps
    end
  end
end
