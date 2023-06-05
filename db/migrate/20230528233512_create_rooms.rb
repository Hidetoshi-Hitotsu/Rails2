class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :roomname
      t.text :introduction
      t.string :image
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
