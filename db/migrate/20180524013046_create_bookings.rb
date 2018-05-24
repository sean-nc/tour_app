class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|

      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :number_of_guests, default: 1

      t.timestamps
    end
    add_column :bookings, :event_id, :integer
    add_index  :bookings, :event_id
  end
end
