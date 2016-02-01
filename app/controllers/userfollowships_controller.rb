class UserfollowshipsController < ApplicationController

	def index
		@boats = Boat.all
	end

	def new
		@boat = Boat.find(params[:boat_id])
		@follow = Userfollowship.new
	end

	def create
		@boat = Boat.find(params[:boat_id])
		@follow = @boat.userfollowships.new(userfollowship_params)
		@follow.save
		
		respond_to do |format|
      if @follow.save
        format.html { redirect_to new_boat_path, notice: 'Follow was successfully created.' }
        format.js { render :index }
      end
    end


	end

	private
	def userfollowship_params
		params.require(:userfollowship).permit(:user_id, :boat_id)
	end

end
