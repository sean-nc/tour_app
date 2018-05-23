class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|

      t.string :title
      t.datetime :when
      t.float :duration
      t.text :details
      t.integer :max_bookings
      t.float :price

      t.timestamps
    end
    add_column :bookings, :creator_id, :integer
    add_index  :bookings, :creator_id
  end
end
