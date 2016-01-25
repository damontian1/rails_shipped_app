class BoatsController < ApplicationController
	def index
		@boats = Boat.all
		@follows = current_user.userfollowships.create(userfollowships_path)
	end
	def show
		@boats = Boat.find(params[:id])
		@job = Job.where(boat_id: params[:id])
	end
	def new
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
		@boat = current_user.boats.build(boat_params)
		if @boat.save
			redirect_to user_path(current_user)
		end
	end

	# private
	# def boat_params
	# params.require(:boat).permit(:name, :max_containers, :current_location)
	# end
	def userfollowship_params
		params.require(:userfollowship).permit(:user_id)
	end

end

