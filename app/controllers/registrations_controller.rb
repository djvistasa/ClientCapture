class RegistrationsController < Devise::RegistrationsController
  
  private
  
  def sign_up_params
    params.require(:user).permit(:name, :surname, :job_title, :password, :confirm_password)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :surname, :job_title, :password, :confirm_password)
  end
end
