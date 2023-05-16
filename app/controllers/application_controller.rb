class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  helper_method :current_user, :loggedin?


  def current_user
      @current_user ||= User.find(session[:user_id])  if session[:user_id]
  end

  def loggedin?
 
      !!current_user
  end

  def require_user

 if !loggedin?
  flash[:error] = "you must be Logged in to perform that action"
  
  redirect_to login_path

  end
  end



end
