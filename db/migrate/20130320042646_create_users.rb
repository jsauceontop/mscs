class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :username, :null => false
      t.string :email, :null => false
      t.timestamps
    end
  end
end
