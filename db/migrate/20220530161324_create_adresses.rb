class CreateAdresses < ActiveRecord::Migration[7.0]
  def up
    create_table :adresses do |t|
      t.string :district_name
      t.string :canton_name
      t.string :commune_name
      t.string :locality_name
      t.string :rue_name
      t.string :postal_code

      t.timestamps
    end
  end

  def down 
    drop_table :adresses
  end
end
