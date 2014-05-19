
class ProjectController < ApplicationController
	respond_to :html, :json
	layout 'application'

    before_filter :authenticate_user!

    before_filter :find_user
	before_filter :find_project
	before_filter :find_topic

	
	def create_topics
		#@project=Project.order("projects.created_at ASC").where(:project_id => @project.id)
		#@project=Project.find_by_id(@project.id)
		@topic=Topic.new(params[:topic])
	  
	  	 if  @topic.save
      redirect_to  :controller => 'project',:action => 'project_name',
       	 		:project_id => @topic.project_id
 
  end
	end

	def project_name
		#@project=Project.new
		
		@project_undertaken=Project.where(:user_id => current_user)
				@add_users=AddUserToProject.where(:project_id => @project)
	 @topic = Topic.new(:project_id => @project.id)
		@projects=Project.order("projects.created_at ASC").where(:id => @project.id)
		
		  @topics=Topic.where(:project_id => @project)


		 # @discussions=Discussion.find_by_sql("SELECT DISTINCT(discussions.topic_id),name FROM discussions
     #CROSS JOIN topics  WHERE discussions.topic_id=topics.id ")
		  @discussions=Discussion.scoped.where( :topic_id => @topic_id)
   @todos=Todo.find_by_sql("SELECT * FROM todos
     CROSS JOIN topics  WHERE todos.topic_id=topics.id ")
	
		  @discussion = Discussion.new
		 @todo = Todo.new
		 #@topic = Topic.new(:project_id => @project.id)
		#@topics=Topic.order("topics.created_at ASC")
		@user=User.new
		@users=User.order('email ASC')

		if @query = params[:query]  
       @project = Project.user_search(@query)
   end
	end

	def index
		@add_users=AddUserToProject.where(:project_id => @project)
		@projects=Project.new
		@discussion=Discussion.order('created_at asc').where(:topic_id => @topics)
		#@projects=Project.order("projects.created_at ASC").where(:project_id => @project)
        @topics=Topic.order('created_at asc').where(:project_id => '1')
			current_user_id=User.where(@user)
		@project=Project.where(:user_id => current_user)
		@user=User.order("email ASC")
		#@project=Project.order("projects.created_at ASC")
		if @query = params[:query]  
       @project = Project.text_search(@query)
   end
	end


	def new
		@project = Project.new
		@user=User.order("email ASC")
	end

	def show
			current_user_id=User.where(@user)
		@project=Project.where(:user_id => current_user)
		#@project=Project.order("projects.created_at ASC")
		@user=User.order("usernames ASC")
	end

	def create
		@project= Project.new(params[:project])
		if @project.save
			
			redirect_to(:action => 'index')
		else
			render 'new'
		end
	end
	def create_discussion
    	    @discussion=Discussion.new(params[:discussion])
		if @discussion.save
			render :partial => 'shared/discussion', :object => @discussion
	 		#redirect_to(:action => 'list', :topic_id => @discussion.topic.id )
		else
      		render('list')
		end
	end

		def save_todo
    	@todo=Todo.new(params[:todo])
	if @todo.save
		
	  redirect_to :controller => 'project',:action => 'index'
	
	else
      render('list')
	end
end
 
 def create_todo
    	@todo=Todo.new(params[:todo])
	if @todo.save
	render :partial => 'shared/todo', :object => @todo
	
	
	else
      render('list')
	end
end


	def edit
		@project=Project.find(params[:id])
		@user=User.order("email ASC")
	end

	def update
		  @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, :notice => 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
     end
    end
		#if @project.update_attributes(params[:project])
			#redirect_to(:action => 'show', :id => @project.id)
			
		#else
			#render('edit')
		#end
	end

	def home
		redirect_to("http://localhost:3000")
	end

	def delete
		@project=Project.find(params[:id])
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		flash[:notice] = "Project destroyed."
		redirect_to(:action => 'show')
	end
	def document
			@project=Project.scoped
	end
	

	def add_user
		@add_user=AddUserToProject.new(params[:add_user_to_projects])
		if @add_user.save	
			redirect_to :controller => "project",:action => "project_name",:project_id => @add_user.project_id
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

	def find_user
		if params[:user_id]
			@user=User.find_by_id(params[:user_id])

		end
	end

	

#calender
	def calendar
		@project=Project.this_month
		@date=Date.today
	end
end
