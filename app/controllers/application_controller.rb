class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_global_search_variable

  protect_from_forgery with: :exception
  helper_method :current_cart

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_cart
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_cart_or_create
    cart = current_cart
    if cart.new_record?
      cart.save
      session[:order_id] = cart.id
    end
    return cart
  end

  def set_global_search_variable
    @q = Book.search(params[:q])
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
