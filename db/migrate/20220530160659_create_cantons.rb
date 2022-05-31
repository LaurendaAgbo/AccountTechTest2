class CreateCantons < ActiveRecord::Migration[7.0]
  def up
    create_table :cantons do |t|
      t.string :name
      t.references :districts, foreign_key: true, index: true

      t.timestamps
    end
  end

  def down
    drop_table :cantons
  end
end
