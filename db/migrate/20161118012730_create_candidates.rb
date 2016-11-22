class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
    	t.belongs_to :position, index: true, null: false
    	t.string :name
    	t.text :biography

      t.timestamps
    end
  end
end
