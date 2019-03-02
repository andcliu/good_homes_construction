class Project < ApplicationRecord
	belongs_to :client
	has_many :milestones
	def self.admin_view 
		%w'client name estimated_amount estimated_start_date actual_start_date final_amount completion_date is_completed blueprints_url'
	end

	def self.form_view 
		%w'name estimated_amount estimated_start_date actual_start_date final_amount completion_date is_completed blueprints_url client_id'
	end

	def relations 
		%w'milestones'
	end

end
