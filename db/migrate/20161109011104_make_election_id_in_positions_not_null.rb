class MakeElectionIdInPositionsNotNull < ActiveRecord::Migration[5.0]
  def change
  	change_column_null :positions, :election_id, false
  end
end
