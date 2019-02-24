
class Item < ApplicationRecord
	belongs_to :category
	
	def self.list_view
		%w'name price description'
	end

	def self.admin_view 
		self.list_view + %w'updated_at'
	end

	def self.form_view 
		self.list_view + %w'category_id'
	end

	def category_name
		self.category.name
	end

end
