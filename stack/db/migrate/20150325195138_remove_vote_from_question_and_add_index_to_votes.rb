class RemoveVoteFromQuestionAndAddIndexToVotes < ActiveRecord::Migration
  def change
    remove_column :questions, :votes
    add_index :votes, [:vote_type_id, :user_id], :unique => true
  end
end
