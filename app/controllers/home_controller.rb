class HomeController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  before_action :authenticate_user!
  def index
    @clients = Client.all
    @current = current_user

    logger.info(current_user.email)
  end

  def admin_logout
    sign_out current_user
    #after_sign_out_path_for(User)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
