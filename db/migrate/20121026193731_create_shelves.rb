class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.string :name
      t.text :description
      t.string :currency
      t.string :language

      t.timestamps
    end
  end
end
