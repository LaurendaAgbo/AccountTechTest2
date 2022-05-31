class CreateRues < ActiveRecord::Migration[7.0]
  def up
    create_table :rues do |t|
      t.string :name
      t.string :name_upcase
      t.string :mot_tri
      t.integer :nomenclature_code
      t.string :indic_lieu_dit
      t.date :date_fin_valid
      t.references :cptch_type_rue, null: false
      t.references :cptch_numero_rue, null: false
      t.references :localite_id, null: false

      t.timestamps
    end

    add_foreign_key :rues, :code_pts_chsses, column: :cptch_type_rue
    add_foreign_key :rues, :code_pts_chsses, column: :cptch_numero_rue
    add_foreign_key :rues, :localities, column: :localite_id
  end

  def down 
    drop_table :rues
  end
end
