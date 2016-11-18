class CreateUsersElectionJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :elections_users, :id => false do |t|
    	t.integer "user_id"
    	t.integer "election_id"
    end
    add_index :elections_users, ["user_id", "election_id"]
  end

  def down
  	drop_table :elections_users
  end

end
