class AddTitleToElections < ActiveRecord::Migration[5.0]
  def change
  	add_column :elections, :title, :text
  end
end
