class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:Rails.application.credentials.gmail[:mail], subject: "ユーザーよりお問い合わせ"
  end
end
