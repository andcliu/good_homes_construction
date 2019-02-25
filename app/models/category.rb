class Category < ApplicationRecord
	has_many :items, :dependent => :destroy

	def self.list_view
		%w'name notes'
	end

	def list_view 
		%w'name'
	end

	def relations 
		%w'items'
	end
	
	def self.relations
		%w'items'
	end
end
