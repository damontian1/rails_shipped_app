class BoatsController < ApplicationController
	def index
		@boats = Boat.all
		# @follows = current_user.userfollowships.create(userfollowships_path)
	end
	def show
		@boats = Boat.find(params[:id])
		@job = Job.where(boat_id: params[:id])
	end
	def new
		@follow = User.find(11).follows
		@boat = Boat.new
		if current_user
		@boats = current_user.boats
		else
		redirect_to log_in_path
		end
	end

	def create
		# @boat = Boat.create(boat_params)
		# redirect_to @boat
		@boat = current_user.boats.new(boat_params)
		if @boat.save
			redirect_to new_boat_path
		else
			flash[:notice] = "Another boat has the same name, try again.."
			 redirect_to new_boat_path
		end
	end

	private
	def boat_params
	params.require(:boat).permit(:name, :max_containers, :current_location, :avatar)
	end

end

