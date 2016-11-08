ActiveAdmin.register User do

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

      f.input :name, :hint => "Enter the User Name"
      f.input :surname, :hint => "Enter the User Surname"
      f.input :job_title, :hint => "Enter the Users Job title"
      f.input :email, :hint => "Enter an Email address"
      f.input :password, :hint => "Create a password"
      #f.input :admin, :label => "Check if user is admin (has access to posts and has the ability to add/delete/create them)"
      #f.input :super_user, :label => "Check if user is a super user (Has access to timesheets aswell as posts)"
      #f.input :bnry_admin, :label => "Check if user is bnry admin (can only log timesheets)"
      #f.input :auditor, :label => "Check if user is an auditor (Handles internal review of posts)"


    end

    f.inputs "Media" do

      f.input :avatar, :hint => image_tag(f.object.avatar.url(:thumb), alt: ""), :label => "Upload user avatar"

    end
    f.actions
  end

  index do

    selectable_column
    column :id
    column :name
    column :surname
    column :job_title
    column :email
    column :avatar do |u|
      image_tag(u.avatar.url(:thumb))
    end

    actions

  end

  show do |user|
    attributes_table do
      row :id
      row :name
      row :surname
      row :job_title
      row :email
      row :avatar do
        image_tag(user.avatar.url(:thumb))
      end
    end

  end


end
