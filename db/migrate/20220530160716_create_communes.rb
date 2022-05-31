class CreateCommunes < ActiveRecord::Migration[7.0]
  def up
    create_table :communes do |t|
      t.string :code
      t.string :name
      t.string :name_upcase
      t.string :canton_code, :default => '?'

      t.timestamps
    end

    add_index :cantons, :code, unique: false
    add_foreign_key :communes, :cantons, column: :canton_code, primary_key: :code
  end

  def down 
    drop_table :communes

    remove_index :cantons, column: :code
    remove_foreign_key :communes, column: :canton_code
  end
end
