class CreateHits < ActiveRecord::Migration[5.0]
  def change
    create_table :hits do |t|
      t.integer :player_id
      t.integer :head
      t.integer :chest
      t.integer :back

      t.timestamps
    end
  end
end
