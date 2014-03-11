class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps
    end
  end
end
