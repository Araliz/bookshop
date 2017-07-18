class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  layout 'admin'

end
