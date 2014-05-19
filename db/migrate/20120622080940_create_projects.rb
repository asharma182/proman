class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string "project_topics"
    	t.string "project_name"
    	t.date "estimeted_complete_date"
    	t.boolean "done"
    	t.string "resources"
    	t.string "project_manager_name"
    	t.float "cost"
      t.string "user_id"
      t.string "text_document"
      t.integer "dates"
      t.string "events"
      

      t.timestamps
    end
    add_index("projects","user_id")
  end
end
