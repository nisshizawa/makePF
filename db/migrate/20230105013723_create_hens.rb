class CreateHens < ActiveRecord::Migration[6.1]
  def change
    create_table :hens do |t|
      t.integer :user_id      
      t.string :animal_name, null: false  #品種名
      t.text :comment
      t.string :amount, null: false
      t.string :vaccine, null: false      #ワクチン接種
      t.string :arrival, null: false      #入荷
      t.boolean :is_active
      t.timestamps
    end
  end
end
