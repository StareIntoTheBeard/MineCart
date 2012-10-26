class CreateShelfPages < ActiveRecord::Migration
  def change
    create_table :shelf_pages do |t|
      t.string :title
      t.text :content
      t.string :tags

      t.timestamps
    end
  end
end
