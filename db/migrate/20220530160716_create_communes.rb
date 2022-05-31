class CreateCommunes < ActiveRecord::Migration[7.0]
  def up
    create_table :communes do |t|
      t.string :name
      t.string :name_upcase
      t.belongs_to :cantons, foreign_key: true, index: true

      t.timestamps
    end
  end

  def down 
    drop_table :communes
  end
end
