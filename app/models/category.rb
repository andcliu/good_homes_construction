class Category < ApplicationRecord
	has_many :items, :dependent => :destroy
	
	def self.relations
		%w''
	end
	def self.list_view
		%w'name notes'
	end

	def list_view 
		%w'name'
	end

end
