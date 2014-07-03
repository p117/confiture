class MailerController < ApplicationController
  before_filter :check_access

  def index
  	render "index"
  end
  def send_email
  	@customers = Customer.all
  	@customers.each do |c|
  		UserMailer.confiture_email(c).deliver
  	end
  	redirect_to :action => "index"
  end
 end