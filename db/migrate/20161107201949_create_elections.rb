class CreateElections < ActiveRecord::Migration[5.0]
  def change
    create_table :elections do |t|
    	t.text :description
    	t.datetime :start_date
    	t.datetime :close_date

    	t.timestamps
    end
  end
end
