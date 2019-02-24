class ApplicationRecord < ActiveRecord::Base
	include ApplicationHelper
	scope :order_desc, -> {
	  order('updated_at DESC')
	}

  self.abstract_class = true
	def self.list_view 
	end
	def list_view 
	end

	def form_view 
	end



	def self.relations 
		if self.reflect_on_all_associations(:has_many).present? 
			return self.reflect_on_all_associations(:has_many).collect{|e|e.plural_name}
		end
	end

	def self.form_view
	end
	def admin_view 
	end

	def self.admin_view 
	end

	def to_s 
		self.try :name
	end

end
