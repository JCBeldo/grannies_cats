class CreateGrannies < ActiveRecord::Migration[7.0]
  def change
    create_table :grannies do |t|
      t.string :name
      t.boolean :has_treats
      t.integer :age

      t.timestamps
    end
  end
end
