class CreateLocalities < ActiveRecord::Migration[7.0]
  def up
    create_table :localities do |t|
      t.string :number
      t.string :name
      t.string :name_upcase
      t.integer :code
      t.string :indic_ville
      t.date :date_fin_valid
      t.string :canton_code, :default => '?'
      t.string :commune_code, :default => '?'

      t.timestamps
    end

    add_index :cantons, :code, unique: false, name: 'cantons_on_code_2'
    add_index :communes, :code, unique: false
    add_foreign_key :localities, :cantons, column: :canton_code, primary_key: :code
    add_foreign_key :localities, :communes, column: :commune_code, primary_key: :code
  end

  def down 
    drop_table :localities

    remove_index :cantons, name: 'cantons_on_code_2'
    remove_index :communes, column: :code
    remove_foreign_key :localities, column: :canton_code
    remove_foreign_key :localities, column: :commune_code
  end
end
