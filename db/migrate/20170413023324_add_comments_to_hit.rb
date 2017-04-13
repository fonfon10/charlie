class AddCommentsToHit < ActiveRecord::Migration[5.0]
  def change
    add_column :hits, :comments, :text
  end
end
