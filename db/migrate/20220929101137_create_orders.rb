class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_price
      t.decimal :discount
      t.decimal :descount_type
      t.decimal :total

      t.timestamps
    end
  end
end
