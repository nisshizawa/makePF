class CreateManagements < ActiveRecord::Migration[6.1]
  def change
    create_table :managements do |t|

      t.timestamps
    end
  end
end
