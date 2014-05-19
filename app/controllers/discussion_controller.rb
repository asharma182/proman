
class DiscussionController < ApplicationController

	before_filter :authenticate_user!

	before_filter :find_user
	before_filter :find_topic
	before_filter :find_project

    def list
     @discussion = Discussion.new(:topic_id => @topic.id )
     @discussions = Discussion.where(:topic_id => @topic.id )
     @topics=Topic.order("topic_name ASC")
     @topicss=Topic.order("topic_name ASC")
     @project=Project.order("projects.created_at ASC")
    end

	def create
    	    @discussion=Discussion.new(params[:discussion])
		if @discussion.save
	 		redirect_to(:action => 'list', :topic_id => @discussion.topic.id )
		else
      		render('list')
		end
	end

	def edit
	end

	def update
	end

	 def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to discussion_url }
      format.json { head :no_content }
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

	def find_user
		if params[:user_id]
			@user=User.find_by_id(params[:user_id])
		end
	end
end