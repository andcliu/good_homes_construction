class AdminsController < ApplicationController 
	def index
    authorize this
	end
end