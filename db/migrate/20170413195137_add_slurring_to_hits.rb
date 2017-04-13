class AddSlurringToHits < ActiveRecord::Migration[5.0]
  def change
    add_column :hits, :slurring, :integer
  end
end
