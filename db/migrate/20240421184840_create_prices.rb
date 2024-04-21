class CreatePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :prices do |t|
      t.references :event, null: false, foreign_key: true
      t.string :category
      t.float :ticket_price

      t.timestamps
    end
  end
end
