class AddColumnsToElectionTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :elections, :description, :text
  	add_column :elections, :start_date, :text
  	add_column :elections, :cloes_date, :text
  end
end
