class CreateCantons < ActiveRecord::Migration[7.0]
  def up
    create_table :cantons do |t|
      t.string :code
      t.string :name
      t.string :district_code, :default => '?'

      t.timestamps
    end

    add_index :districts, :code, unique: false
    add_foreign_key :cantons, :districts, column: :district_code, primary_key: :code
  end

  def down
    drop_table :cantons

    remove_index :districts, column: :code
    remove_foreign_key :cantons, column: :district_code
  end
end
