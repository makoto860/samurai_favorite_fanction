class CreateShoppingCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :shopping_carts do |t|
      t.boolean :buy_flag, null: false, default: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
