class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :vote_type_id
      t.string :vote_type_name

      t.timestamps null: false
    end
  end
end
