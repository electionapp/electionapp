class CreateElections < ActiveRecord::Migration[5.0]
  def change
    create_table :elections do |t|
    	t.text :description
    	t.text :start_date
    	t.text :cloes_date

    	t.timestamps
    end
  end
end
