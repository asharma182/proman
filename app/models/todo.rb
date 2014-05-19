class Todo < ActiveRecord::Base
  attr_accessible :add, :visible, :priority, :created_at, :project_id, :topic_id, :status
  belongs_to :project
  belongs_to :topic
end
