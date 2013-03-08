class CreateMentorsTopicsJoinTable < ActiveRecord::Migration
  def change
  	create_table 'mentors_topics', :id => false do |t|
  		t.column :mentor_id, :integer
  		t.column :topic_id, :integer
  	end
  end
end
