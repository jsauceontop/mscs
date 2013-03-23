class CreateMentees < ActiveRecord::Migration
  def change
    create_table :mentees, :inherits => :user do |t|

      t.timestamps
    end
  end
end
