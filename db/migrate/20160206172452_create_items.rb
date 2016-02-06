class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :content
      t.decimal :price
      t.integer :time
      t.integer :unit
      t.string :author
      t.string :location
      t.integer :telephone
      t.boolean :rent
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
