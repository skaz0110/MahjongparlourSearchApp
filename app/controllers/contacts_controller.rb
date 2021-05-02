class ContactsController < ApplicationController
  
  before_action :set_search

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to thanks_contacts_path, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def thanks
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

  def set_search
    @q = Post.ransack(params[:q])
  end
end
