class AssociateUsers < ActiveRecord::Migration
  def change
    add_column :answers, :user_id, :integer
    add_foreign_key :answers, :users
    add_column :votes, :user_id, :integer
    add_foreign_key :votes, :users
  end
end
