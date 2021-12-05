class ContactsController < ApplicationController
  before_action :login_check

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to thanks_contacts_path, notice: 'お問い合わせを送信しました'
    else
      flash.now[:alert] = 'お問い合わせに失敗しました'
      render :new 
    end
  end
  
  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
