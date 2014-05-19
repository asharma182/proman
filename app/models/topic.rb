class Topic < ActiveRecord::Base
  attr_accessible :project_id, :topic_name, :topic_id
  belongs_to :project
  has_many :discussions, :foreign_key => :topic_id
  has_many :todos
end
