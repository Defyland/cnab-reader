class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :representative
      t.decimal :balance, precision: 10, scale: 2, default: 0
      t.timestamps
    end
  end
end
