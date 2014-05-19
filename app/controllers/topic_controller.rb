
class TopicController < ApplicationController
	layout 'application'
	
	  before_filter :authenticate_user!
	before_filter :find_project
	before_filter :find_topic

	def view
		@topics = Topic.order('topics.created_at ASC')
		# @topic = Topic.where0(:topic_id => @topic.id)
  end

	def home
		redirect_to("http://localhost:3000")
	end  

	def list
    @topic = Topic.new(:project_id => @project.id)
    @topics = Topic.where(:project_id => @project.id) 
   
    @discussions=Discussion.find_by_sql("SELECT DISTINCT(discussions.topic_id),name FROM discussions
     CROSS JOIN topics  WHERE discussions.topic_id=topics.id ")
   @todos=Todo.find_by_sql("SELECT * FROM todos
     CROSS JOIN topics  WHERE todos.topic_id=topics.id ")
  end
  
	def create
    	@topic=Topic.new(params[:topic])
	if @topic.save
		redirect_to(:action => 'list', :project_id => @topic.project_id)
	
	else
      render('list')
	end
end

private

	def find_project
		if params[:project_id]
			@project=Project.find_by_id(params[:project_id])
		end
	end

	def find_topic
		if params[:topic_id]
			@topic=Topic.find_by_id(params[:topic_id])
		end
	end
end


	


