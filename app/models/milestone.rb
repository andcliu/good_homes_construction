class Milestone < ApplicationRecord
  belongs_to :project
  # has_many :employees, dependent: :destroy
  has_one :invoice
  # before_save :remove_employee_nil
  after_save :check_for_completion_date

  def self.admin_view 
  	%w'name start_date completion_date task_description notes employees project'
  end

  def self.form_view 
  	%w'name start_date completion_date task_description notes employee_ids project_id'
  end

  def list_view 
  	%w'name start_date completion_date task_description notes project'
  end

  def employees
  	Employee.find_employee_name(self.employee_ids.reject{|e|e.blank?}).join(", ")
  end

  def project_milestones_length 
    project.milestones.size
  end

  def project_amount 
    project.final_amount.present? ? project.final_amount : project.estimated_amount
  end

  def amount_due 
    (self.project_amount/self.project_milestones_length).to_f
  end

  def client 
    project.client_id
  end


  def check_for_completion_date 

    if self.completion_date.present?
      p "it's fucking working!"
      Invoice.new_invoice(self.amount_due,Date.today,self.task_description,self.client,self.project_id,self.id)
    end
  end

  def self.relations 
    %w'invoice'
  end

  def relations 
    %w'invoice'
  end
end
