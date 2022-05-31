class CreateRues < ActiveRecord::Migration[7.0]
  def up
    create_table :rues do |t|
      t.integer :number
      t.string :name
      t.string :name_upcase
      t.string :mot_tri
      t.integer :nomenclature_code
      t.string :indic_lieu_dit
      t.date :date_fin_valid
      t.string :cptch_type_rue, :default => '?'
      t.string :cptch_numero_rue, :default => '?'
      t.string :locality_number, :default => '?'
      #Ex:- :default =>''

      t.timestamps
    end

    add_index :localities, :number, unique: false
    add_foreign_key :rues, :localities, column: :locality_number, primary_key: :number
  end

  def down 
    drop_table :rues

    remove_index :localities, :number
    remove_foreign_key :rues, column: :locality_number
  end
end
