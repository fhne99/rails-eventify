class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.string :category
      t.integer :available_tickets

      t.timestamps
    end
  end
end
