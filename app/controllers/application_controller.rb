class ApplicationController < ActionController::Base
  protect_from_forgery
  def new_url
  	render('http://localhost:3000/explore/index/')
  end
end
