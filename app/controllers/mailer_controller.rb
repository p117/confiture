class MailerController < ApplicationController
  def index
  	render "index"
  end
  def send_email
  	@customers = Customer.first
  	@customers.each do |c|
  		UserMailer.confiture_email(c).deliver
  	end
  	redirect_to :action => "index"
  end
 end