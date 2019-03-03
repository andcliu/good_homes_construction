class QuotesController < ApplicationController 
	after_action :create_projects, only: [:create]

	def create_projects 
		if params[:quote][:is_approved]==1
			q=params[:quote]
			Project.create({name:q[:project_name],estimated_amount:q[:estimate],client_id:q[:client_id]})
		end
	end
end