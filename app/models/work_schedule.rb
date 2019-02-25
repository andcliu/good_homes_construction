class WorkSchedule < ApplicationRecord
  belongs_to :employee
  belongs_to :client
  belongs_to :work_day

  def self.form_view 
  	%w'hours work_description notes employee_id client_id work_day_id'
  end

  def self.admin_view 
  	%w'hours work_description notes employee_name client_name work_date'
  end

  def employee_name
  	self.employee.name
  end

  def client_name 
  	self.client.name
  end

  def work_date 
  	self.work_day.to_s
  end

	def to_s 
		employee_name
	end

  def employee_client
    "<span class='well'><i>#{client_name}</i><br>#{employee_name}</span>".html_safe
  end
end
