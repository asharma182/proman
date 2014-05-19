
class UserRecordsController < ApplicationController
  # GET /user_records
  # GET /user_records.json
  def index
    @user_records = UserRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user_records }
    end
  end

  # GET /user_records/1
  # GET /user_records/1.json
  def show
    @user_record = UserRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user_record }
    end
  end

  # GET /user_records/new
  # GET /user_records/new.json
  def new
    @user_record = UserRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user_record }
    end
  end

  # GET /user_records/1/edit
  def edit
    @user_record = UserRecord.find(params[:id])
  end

  # POST /user_records
  # POST /user_records.json
  def create
    @user_record = UserRecord.new(params[:user_record])

    respond_to do |format|
      if @user_record.save
        format.html { redirect_to @user_record, :notice => 'User record was successfully created.' }
        format.json { render :json => @user_record, :status => :created, :location => @user_record }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_records/1
  # PUT /user_records/1.json
  def update
    @user_record = UserRecord.find(params[:id])

    respond_to do |format|
      if @user_record.update_attributes(params[:user_record])
        format.html { redirect_to @user_record, :notice => 'User record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_records/1
  # DELETE /user_records/1.json
  def destroy
    @user_record = UserRecord.find(params[:id])
    @user_record.destroy

    respond_to do |format|
      format.html { redirect_to user_records_url }
      format.json { head :no_content }
    end
  end
end
