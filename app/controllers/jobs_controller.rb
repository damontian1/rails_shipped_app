class JobsController < ApplicationController
	def new
		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.new
	end

	def create
		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.create(job_params)
		@boat.user = current_user
		if @job.save
		redirect_to boat_path(@boat)
		else
		flash[:notice] = "Job name already taken"
		flash[:notice1] = "Cost must be above $1000"
		flash[:notice2] = "Cargo description must be at least 50 characters"
		redirect_to new_boat_job_path(@boat)
	end
	end

	private
	def job_params
		params.require(:job).permit(:name, :containers_needed, :cargo, :cost, :origin, :destination)
	end

end
