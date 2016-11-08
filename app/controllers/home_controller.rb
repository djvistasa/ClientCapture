class HomeController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  before_action :authenticate_user!
  def index
    @clients = Client.all
    @current = current_user

    logger.info(current_user.email)
  end

  def client
    @current = current_user

    @client = Client.find_by(id: params[:id])
  end

  def edit_client
    @current = current_user

    @client = Client.find_by(id: params[:id])

  end
end
