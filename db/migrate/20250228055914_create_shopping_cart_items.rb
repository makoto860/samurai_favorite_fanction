class CreateShoppingCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :shopping_cart_items do |t|
      t.shopping_cart_item_fields
      t.timestamps
    end
  end
end
