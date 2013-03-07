class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string "title", :limit => 25, :null => false
    	t.string "description", :limit => 100
    	t.timestamps
    end
  end
end
