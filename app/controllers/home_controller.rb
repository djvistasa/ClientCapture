class HomeController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  before_action :authenticate_user!
  def index
    @clients = Client.all
    @current = current_user
    @client = Client.new

  end


  def client
    @current = current_user

    @client = Client.find_by(id: params[:id])
  end

  def edit_client
    @current = current_user

    @client = Client.find_by(id: params[:id])

    respond_to do |format|
      if @client.update_attributes(client_params)
        format.html { redirect_to client_path(@client), notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to client_path(@client), notice: 'Client was not updated' }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_client

    respond_to do |format|
      format.html
      format.js
    end
  end

  def admin_logout
    sign_out current_user
    #after_sign_out_path_for(User)

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def client_params
    params.require(:client).permit(:name,:surname,:email,:cellnumber, :address,:avatar)
  end
end
