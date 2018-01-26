class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :init_current_cart
  
  private
  
  def init_current_cart
    @user = current_user
    if @user.current_cart == nil
       @user.current_cart =  @user.carts.create
       @user.save
       @user.current_cart
    else
       @user.current_cart
    end
  end
  

  
end
