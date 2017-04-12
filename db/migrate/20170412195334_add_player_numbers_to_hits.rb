class AddPlayerNumbersToHits < ActiveRecord::Migration[5.0]
  def change
    add_column :hits, :digit_left, :integer
    add_column :hits, :digit_right, :integer
  end
end
