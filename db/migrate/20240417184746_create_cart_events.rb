class CreateCartEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_events do |t|
      t.references :event, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
