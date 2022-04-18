class CreateShirts < ActiveRecord::Migration[6.1]
  def change
    create_table :shirts do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :price
      t.boolean :bought?
    end
  end
end
