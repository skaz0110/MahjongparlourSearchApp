class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"to.too.0110@gmail.com", subject: "お問い合わせ"
  end
end
