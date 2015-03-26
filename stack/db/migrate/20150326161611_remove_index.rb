class RemoveIndex < ActiveRecord::Migration
  def change
  	remove_index :votes, [:vote_type_id, :user_id]
  end
end
