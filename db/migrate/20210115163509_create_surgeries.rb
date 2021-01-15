class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.integer :day
      t.integer :room_number
    end
  end
end
