class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|

      t.string :title
      t.datetime :when
      t.string :duration
      t.text :details
      t.integer :max_bookings
      t.float :price

      t.timestamps
    end
    add_column :events, :creator_id, :integer
    add_index  :events, :creator_id
  end
end
