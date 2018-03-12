class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do
  	redirect_to root_path, notice: "The page looking for does not exist"
  end
  protected

  def configure_permitted_parameters
    added_attrs = [:username, :mobile]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  private

  # def set_cart
  #   @cart_line_item = CartLineItem.find(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart_line_item = CartLineItem.create
  #   session[:cart_id]=@cart_line_item.id
  # end
end
