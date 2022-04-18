class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :shirt_id
      t.integer :pant_id
      t.integer :shoe_id
    end
  end
end
