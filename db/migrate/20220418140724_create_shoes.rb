class CreateShoes < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :price
      t.boolean :bought?
      t.boolean :in_cart?
    end
  end
end
