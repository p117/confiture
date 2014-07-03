class UserMailer < ActionMailer::Base
  default from: "pierre.lecigne@gmail.com"

  def confiture_email(customer)
  	@customer = customer
  	p @customer.email
    mail(to: @customer.email, subject: 'We are going to product new confitures !')
  end
end
