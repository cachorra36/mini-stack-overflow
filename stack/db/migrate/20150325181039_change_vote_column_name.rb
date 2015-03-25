class ChangeVoteColumnName < ActiveRecord::Migration
  def change
    remove_column :votes, :vote_type_name
    add_column :votes, :vote_type_type, :string 
  end
end
