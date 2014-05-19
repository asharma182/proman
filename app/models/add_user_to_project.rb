class AddUserToProject < ActiveRecord::Base
   attr_accessible :add_more_user, :project_id, :user_id
   belongs_to :project
   belongs_to :user
end
