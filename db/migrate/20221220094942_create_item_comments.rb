class CreateItemComments < ActiveRecord::Migration[6.1]
  def change
    create_table :item_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :item_id
      t.float :rate, null: false, default: 0

      t.timestamps
    end
  end
end
