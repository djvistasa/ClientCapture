ActiveAdmin.register Client do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name, hint: "Please enter the client name"
      f.input :surname, hint: "Please enter the client surname"
      f.input :cellnumber, hint: "Please enter the clients cell number"
      f.input :email, hint: "PLease enter the clients email"
      f.input :address, as: :text,input_html: {class: "clearfix"}

    end

    f.inputs "Media" do
      f.input :avatar, :hint => image_tag(f.object.avatar.url(:thumb), alt: ""), :label => "Upload Image (800 * 800)"

    end

    f.actions
  end


end
