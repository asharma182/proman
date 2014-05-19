
class TopicsController < ApplicationController
	layout 'application'
	
	  before_filter :authenticate_user!
	before_filter :find_project
	before_filter :find_topic

  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
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
	  respond_to do |format|
	  	 if  @topic.save
      format.html { redirect_to :controller => 'project',
        :action => 'project_name',:project_id => @topic.project_id}
     format.js
  end
  end
end
 def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to :controller => 'project', :action => 'project_name', :project_id => @project_id }
      format.json { head :no_content }
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


	


