class EmployeeInformation < ApplicationRecord
  belongs_to :employee
	def self.admin_view 
		%w'dob address city zipcode phone phone2 email wage employee' 
	end

	def self.list_view 
		%w'dob address city zipcode phone phone2 email current_wage previous_wage employee_id' 
	end


	def wage 
		self.current_wage
	end

	def self.form_view 
		self.list_view
	end

end
