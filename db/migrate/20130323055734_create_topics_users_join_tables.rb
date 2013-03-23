class CreateTopicsUsersJoinTables < ActiveRecord::Migration
  def change
    create_table 'topics_users', :id => false do |t|
  		t.column :user_id, :integer
  		t.column :topic_id, :integer
  	end
  end
end
