class AddIsApproveToTopics < ActiveRecord::Migration
  def change
  	add_column :topics, :isApproved, :boolean
  	Topic.reset_column_information
  	Topic.all.each do |t|
  		t.update_attributes!(:isApproved => 'false')
  	end
  end
end
