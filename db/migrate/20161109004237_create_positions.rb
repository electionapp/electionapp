class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
    	t.belongs_to :election, index: true
    	t.text :title
    	t.text :description
    	
      t.timestamps
    end
  end
end
