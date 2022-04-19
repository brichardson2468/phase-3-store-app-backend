class CreateShoes < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :price
      t.integer :bought
    end
  end
end
