class Client < ApplicationRecord
	has_many :projects
	has_many :quotes
	has_many :invoices
	
	def self.admin_view 
		%w'name address city zipcode phone phone2 email onboard_date notes' 
	end

	def self.find_name e
		self.find(e).name
	end

	def relations
		%w'projects quotes invoices'
	end
end
