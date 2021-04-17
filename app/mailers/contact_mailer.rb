class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:ENV.fetch("GMAIL"), subject: "ユーザーよりお問い合わせ"
  end
end
