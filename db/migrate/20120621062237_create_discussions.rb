class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :name
    	t.string :started_by
    	t.integer :topic_id
    	t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
   add_index("discussions","topic_id")
   add_index("discussions","project_id")
   add_index("discussions","user_id")
  end
end
