class CreateLocalities < ActiveRecord::Migration[7.0]
  def up
    create_table :localities do |t|
      t.string :name
      t.string :name_upcase
      t.integer :code
      t.string :indic_ville
      t.date :date_fin_valid
      t.belongs_to :communes, foreign_key: true, index: true
      t.belongs_to :cantons, foreign_key: true, index: true

      t.timestamps
    end
  end

  def down 
    drop_table :localities
  end
end
