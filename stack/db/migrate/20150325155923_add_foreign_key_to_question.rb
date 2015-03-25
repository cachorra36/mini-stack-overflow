class AddForeignKeyToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer
    add_foreign_key :questions, :users
  end
end
