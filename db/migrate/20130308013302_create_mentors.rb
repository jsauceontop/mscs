class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
    	t.string "firstname", :null => false, :limit => 25
    	t.string "lastname", :limit => 25
    	t.string "profile", :limit => 100
      	t.timestamps
    end
  end
end
