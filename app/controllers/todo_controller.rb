
class TodoController < ApplicationController

	before_filter :authenticate_user!
	before_filter :find_topic
	before_filter :find_project

    def list
     @todo = Todo.new(:topic_id => @topic.id )
     @todos = Todo.where(:topic_id => @topic.id )
 
  end

	def create
    	@todo=Todo.new(params[:todo])
	if @todo.save
		
	  redirect_to(:action => 'list', :topic_id => @todo.topic.id )
	
	else
      render('list')
	end
end

private

	def find_topic
		if params[:topic_id]
			@topic=Topic.find_by_id(params[:topic_id])
		end
	end

	def find_project
		if params[:project_id]
			@project=Project.find_by_id(params[:project_id])
		end
	end
end