class CreateCustomerCards < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_cards do |t|
      t.string :card_number
      t.timestamps
    end
    add_reference :customer_cards, :customer, foreign_key: true
  end
end
