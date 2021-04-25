ActiveAdmin.register Post do

  permit_params :content,:image,:title,:user_id,:phonenumber,:access,:openinghours,:regularholiday,:gamefree,:gameset,:address1,:address2,:address3,:prefecturecode,:postalcode

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :image, :content, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :image, :content, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
