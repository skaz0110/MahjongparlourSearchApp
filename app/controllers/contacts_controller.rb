class ContactsController < ApplicationController
  before_action :login_check

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to homes_path, notice: 'お問い合わせありがとうございました'
    else
      flash.now[:alert] = 'お問い合わせの送信に失敗しました'
      render :new 
    end
  end
  
  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
