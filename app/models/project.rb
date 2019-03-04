class Project < ApplicationRecord
	belongs_to :client
	has_many :milestones
	has_many :invoices
	
	def self.admin_view 
		%w'client name estimated_amount estimated_start_date actual_start_date final_amount completion_date completed? blueprints'
	end

	def self.form_view 
		%w'name estimated_amount estimated_start_date actual_start_date final_amount completion_date is_completed blueprints_url client_id'
	end

	# def self.relations 
	# 	%w'milestones'
	# end
	def relations 
		%w'milestones invoices'
	end

	def blueprints 
		self.blueprints_url
	end

	def completed? 
		self.is_completed
	end
end
