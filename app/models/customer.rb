class Customer < ActiveRecord::Base
	has_many :order_lines, :dependent => :delete_all
	has_many :orders, through: :order_lines

	validates :name, presence: true
	validates :email, presence: true
	validates :phone, presence: true
end
