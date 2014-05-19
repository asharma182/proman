class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
    	t.string :add
    	t.boolean :visible
    	t.integer :priority
    	t.integer :topic_id
      t.integer :project_id
      t.boolean :status

      t.timestamps
    end
    add_index("todos","topic_id")
    add_index("todos","project_id")
  end
end
