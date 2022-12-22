class CreateSimulations < ActiveRecord::Migration[6.1]
  def change
    create_table :simulations do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
  end
end
