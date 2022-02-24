class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :card
      t.string :cpf
      t.integer :type_of_transaction, default: 0
      t.decimal :value, precision: 10, scale: 2, default: 0
      t.datetime :datetime_of_transaction
      t.timestamps
    end
  end
end
