class User < ActiveRecord::Base
	attr_accessible :email, :name, :phone
	
	validates :name, presence: true
	validates :email, :phone, presence: true, uniqueness: true
end
