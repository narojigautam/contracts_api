class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :name
      t.integer :tender_amount
      t.datetime :date
      t.text :description
      t.integer :profit_amount
      t.integer :bill_amount

      t.timestamps
    end
  end
end
