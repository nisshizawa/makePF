class CreateCows < ActiveRecord::Migration[6.1]
  def change
    create_table :cows do |t|
      t.integer :user_id         
      t.string :name, null: false         #個体名
      t.string :animal_name, null: false  #品種名
      t.string :vaccine, null: false      #ワクチン接種
      t.string :arrival, null: false      #入荷
      t.string :estimated, null: false    #分娩
      t.string :mating, null: false       #種付け
      t.string :number, null: false       #個体番号     
      t.text :comment      
      t.boolean :is_active      
      t.timestamps
    end
  end
end
