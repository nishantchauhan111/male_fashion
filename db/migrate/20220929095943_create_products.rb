class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.string :detail
      t.binary :image
      t.decimal :mrp
      t.decimal :discount
      t.string :discount_type
      t.decimal :price
      t.boolean :active

      t.timestamps
    end
  end
end
