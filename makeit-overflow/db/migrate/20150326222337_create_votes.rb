class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
        t.string :votable_id
        t.integer :votable_type

      t.timestamps null: false
    end
  end
end
