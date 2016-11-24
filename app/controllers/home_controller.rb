class HomeController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  before_action :authenticate_user!
  def index
    @clients = Client.all
    @current = current_user
    @client = Client.new

  end

  #clients
  def client
    @current = current_user

    @client = Client.find_by(id: params[:id])

    @cases = @client.cases

    @case = Case.new
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
    @data = { success: 0, message: "Invalid request!" }

    client = Client.create(
        name: params['name'],
        surname: params['surname'],
        cellnumber: 'cellnumber',
        email: params['email'],
        address: params['address'],
        avatar: params['avatar']
    )


    if client.save
      @data = {
          message: "client created succesfully",
          success: 1,
      }

    else
      @data[:message] = client.errors.full_messages

    end

    @clients = Client.all

    respond_to do |format|
      format.html
      format.js
    end
  end
  def delete_client
    @client = Client.find_by(id: params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }

    end
  end

  #cases
  def case

    @case = Case.find_by(id: params[:id])

  end
  def create_case
    @case = Case.create(
        case_number: params['case_number'],
        title: params['title'],
        status: params['status'],
        date: params['date'],
        client_id: params['client_id']
    )

    @case.save

    @client = @case.client

    @cases = @client.cases

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

  def case_params
    params.require(:case).permit(:case_number,:title,:status,:date,:client_id)
  end
end
