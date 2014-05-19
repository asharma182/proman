class Discussion < ActiveRecord::Base
   attr_accessible  :user_id, :name, :started_by, :project_id, :topic_id,:parent_id
   belongs_to :topic, :foreign_key => :topic_id
   belongs_to :project
   belongs_to :user

   has_ancestry

   scope :search, lambda {|query| where(["started_by LIKE ?", "%#{query}%"])}
   
end
