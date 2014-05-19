class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string :topic_name
    	t.integer :project_id

      t.timestamps
    end
    add_index("topics","project_id")
  end
end
