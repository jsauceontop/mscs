class TopicsUsersJoinTable < ActiveRecord::Migration
  def up
  	create_table :topics_users, :id => false do |t|
  		t.integer :topic_id
  		t.integer :user_id
  	end

  	add_index :topics_users, [:topic_id, :user_id]
  end

  def down
  	drop_table :topics_users
  end
end
