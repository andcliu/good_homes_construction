class WorkSchedule < ApplicationRecord
  belongs_to :employee
  belongs_to :client
  belongs_to :work_day

  def self.form_view 
  	%w'hours work_description notes employee_id client_id work_day_id'
  end

  def self.admin_view 
  	%w'hours work_description notes employee client work_day'
  end

	def to_s 
		employee
	end

  def employee_client
    "<span class='well'><i>#{client}</i><br>#{employee}</span>".html_safe
  end
end
