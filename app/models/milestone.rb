class Milestone < ApplicationRecord
  belongs_to :project
  has_many :employees, dependent: :destroy

  def self.admin_view 
  	%w'start_date completion_date task_description notes employees project'
  end

  def self.form_view 
  	%w'start_date completion_date task_description notes employee_id project_id'
  end

  def list_view 
  	%w'start_date completion_date task_description notes project'
  end

  def employees
  	Employee.find_employee_name(self.employee_id.reject{|e|e.blank?}).join(", ")
  end
end
