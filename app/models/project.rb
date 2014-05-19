class Project < ActiveRecord::Base
   attr_accessible :image, :remote_image_url,:project_name, :estimeted_complete_date,
   :done, :resources, :project_manager_name, :cost, :user_id, :email, :id,
    :username, :project_topics, :project_id, :text_document, :dates, :events
    belongs_to :user
     has_many :discussions
     has_many :todos
     has_many :topics
     has_many :add_user_to_projects
     mount_uploader :image, ImageUploader
      

      def username
      	if @user_id
			@user=User.find_by_username(:username)
			return @user
		else
			false
		end
      end
       def self.text_search(query)
      if query.present?
        # where("project_name ilike :q ", q => "%#{query}%")
        find(:all, :conditions => ['project_name LIKE ?', "%#{query}%"])
        #search(query)
      else
        scoped
      end
     end
      def self.user_search(query)
      if query.present?
        # where("project_name ilike :q ", q => "%#{query}%")
        find(:all, :conditions => ['email LIKE or username LIKE ?', "%#{query}%"])
        #search(query)
      else
        scoped
      end
     end
 end
