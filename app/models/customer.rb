class Customer < ActiveRecord::Base
	has_many :order_lines
	has_many :orders, :dependent => :delete_all

	validates :name, presence: true
	validates :email, presence: true
	validates :phone, presence: true
end
