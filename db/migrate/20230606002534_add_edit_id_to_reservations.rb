class AddEditIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :edit_id, :integer
  end
end
