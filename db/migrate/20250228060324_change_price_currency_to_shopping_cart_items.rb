class ChangePriceCurrencyToShoppingCartItems < ActiveRecord::Migration[8.0]
  def change
  end

  def up
    change_column :shopping_cart_items, :price_currency, :string, default: "JPY", null: false
  end

  def down
    change_column :shopping_cart_items, :price_currency, :string, default: "USD", null: false
  end
end
