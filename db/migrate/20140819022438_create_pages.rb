class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.integer :position
      t.boolean :visible
      t.integer :permalink
      t.references :subject, index: true

      t.timestamps
    end
    add_index :pages, :name
    add_index :pages, :permalink
  end
end
