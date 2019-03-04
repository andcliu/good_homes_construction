class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :milestone
  belongs_to :project

  def self.admin_view 
  	%w'amount_due due_date notes paid_date milestone project client invoice_pdf'
  end

  def self.form_view 
  	%w'amount_due due_date notes is_paid milestone_id project_id client_id'
  end

  def self.new_invoice amount_due,due_date,notes,client_id,project_id,milestone_id 
  	self.create({amount_due:amount_due,due_date:Date.today,notes:notes,client_id:client_id,project_id:project_id,milestone_id:milestone_id})
  end

  def invoice_pdf 
  	"<button class='btn btn-primary btn-sm'>p</button>"
  end

end
