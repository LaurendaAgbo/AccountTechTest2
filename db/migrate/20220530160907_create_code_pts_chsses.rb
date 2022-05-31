class CreateCodePtsChsses < ActiveRecord::Migration[7.0]
  def up
    create_table :code_pts_chsses do |t|
      t.string :type_rue
      t.string :numero_rue

      t.timestamps
    end
  end

  def down 
    drop_table :code_pts_chsses
  end
end
