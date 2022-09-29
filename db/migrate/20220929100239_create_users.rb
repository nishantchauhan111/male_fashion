class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :countyr
      t.integer :pincode
      t.string :mail
      t.string :gender

      t.timestamps
    end
  end
end
