class WorkDay < ApplicationRecord
	has_many :work_schedules, dependent: :destroy
	alias_attribute :start_time, :work_date
	def self.admin_view 
		%w'work_date notes'
	end

	def relations 
		%w'work_schedules'
	end

	def to_s 
		work_date
	end
	
	def collection 
		work_schedules.collect{|e|[e.client_id,e.to_s,e.employee_id]}
	end


end
