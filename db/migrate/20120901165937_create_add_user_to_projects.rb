class CreateAddUserToProjects < ActiveRecord::Migration
  def change
    create_table :add_user_to_projects do |t|
    	t.string "add_more_user"
    	t.integer "project_id"
    	t.integer "user_id"


      t.timestamps
    end
    add_index("add_user_to_projects","project_id")
    add_index("add_user_to_projects","user_id")
    end
  end
