class Employee < ApplicationRecord
	has_one :employee_information, dependent: :destroy
	has_many :work_schedules, dependent: :destroy
	def self.admin_view 
		%w'name hire_date termination_date manager status notes' 
	end

	def self.form_view 
		%w'first_name last_name hire_date termination_date is_manager notes'
	end


	def name 
		"#{self.first_name} #{self.last_name}"
	end

	def manager 
		self.is_manager ? 'Yes' : 'No'
	end

	def status 
		self.termination_date.blank? ? 'Active' : 'Not Active'
	end

	def relations 
		%w'employee_information'
	end

end
