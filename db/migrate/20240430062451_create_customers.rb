class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :name
      t.decimal :contract_value
      t.string :location
      t.integer :phone, limit: 8

      t.timestamps
    end
  end
end
