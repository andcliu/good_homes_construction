class Quote < ApplicationRecord
	belongs_to :client
	before_save :check_is_approved_or_cancelled
	def self.admin_view 
		%w'project_name estimate work_description is_approved date_approved is_cancelled date_cancelled client'
	end
	def self.form_view 
		%w'project_name estimate work_description is_approved is_cancelled client_id'
	end
	def check_is_approved_or_cancelled 
		if self.is_approved? and self.is_cancelled?
			self.date_cancelled = nil 
			self.date_approved = nil 
			self.is_approved = 0
			self.is_cancelled = 0
		elsif self.is_approved?
			self.date_approved = Date.today
			self.date_cancelled = nil
			self.is_cancelled = 0
		elsif self.is_cancelled?
			self.date_cancelled = Date.today 
			self.date_approved = nil
			self.is_approved = 0
		end
	end
end
