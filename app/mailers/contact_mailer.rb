class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:ENV.fetch("GMAIL"), subject: "お問い合わせ"
  end
end
