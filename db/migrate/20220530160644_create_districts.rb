class CreateDistricts < ActiveRecord::Migration[7.0]
  def up
    create_table :districts do |t|
      t.string :code, :default => '?'
      t.string :name

      t.timestamps
    end
  end

  def down 
    drop_table :districts
  end
end
