class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.boolean :spayed_neutered
      t.integer :lives
      t.references :granny, null: false, foreign_key: true

      t.timestamps
    end
  end
end
