class JobsController < ApplicationController
	def new
		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.create
	end

	def create
		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.create(job_params)
		redirect_to root_path
	end
	private
	def job_params
		params.require(:job).permit(:name, :containers_needed, :cargo, :cost, :origin, :destination)
	end
end
