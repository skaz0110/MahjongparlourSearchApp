ActiveAdmin.register Comment, :as => "ReviewComment" do

  permit_params :content,:star,:image,:title,:user_id,:post_id
  

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :user_id, :post_id, :star, :image, :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :user_id, :post_id, :star, :image, :title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end