class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :candidate_id
      t.belongs_to :user, index: true#, null: false

      t.timestamps
    end
  end
end
