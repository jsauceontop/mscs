class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors, :inherits => :user do |t|
    	t.string "profile", :limit => 100
      	t.timestamps
    end
  end
end
