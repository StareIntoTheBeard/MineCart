class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.string :name
      t.text :description
      t.string :currency, :default => 'USD'
      t.string :language, :default => 'English'

      t.timestamps
    end
  end
end
