class MilestonesController < ApplicationController
	def create 
		authorize Milestone
    Milestone.create(priv_params)
    redirect_to milestones_path
	end

	def update 
		authorize Milestone
		ms=Milestone.find(params[:id])
		if ms.update(priv_params)
			redirect_to milestone_path(ms)
		else 
			flash[:errors]=ms.errors.full_messages
		end
	end

	private 

	def priv_params 
		params.require(:milestone).permit!
	end
end