
class AccessController < ApplicationController
	layout 'access'
  def index
  	render('menu')
  end

  def menu
  	redirect_to(:controller => 'explore', :action => 'index')
  end

  def login
  end

  def attempt_login
    authorized_user= User.authenticate(params[:email], params[:password])
    if authorized_user
      redirect_to(:controller => 'explore', :action => 'index')
    else
      render('index')
    end
  end

  def logout
  end
end
