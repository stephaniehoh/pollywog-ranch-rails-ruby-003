class TadpolesController < ApplicationController
  
  def index
    @tadpoles = Tadpole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tadpoles }
    end
  end 

  def new
    @frog = Frog.find(params[:frog_id])
    @tadpole = Tadpole.new(:frog_id => params[:frog_id])
  end

  def create
    @frog = Frog.find_by(:id => params[:id])
    @tadpole = Tadpole.new(tadpole_params)
    @tadpole.save
    redirect_to('/tadpoles')
  end

  def show
    @tadpole = Tadpole.find(params[:id])
  end

  def edit
    @ponds = Pond.all
  end

  def update
    @tadpole.update(tadpole_params)
    redirect_to('/tadpoles')
  end

  def destroy
    @tadpole = Tadpole.find(params[:id])
    @tadpole.destroy
    redirect_to('/tadpoles')
  end

  def evolve
    @tadpole = Tadpole.find(params[:id])
    @frog = Frog.new
    @frog.name = @tadpole.name
    @frog.color = @tadpole.color
    @frog.pond = @tadpole.frog.pond
    @frog.save
    @tadpole.destroy
    redirect_to('/tadpoles')
  end

###### Strong Params ######  

  private

  def tadpole_params
    params.require(:tadpole).permit(:name, :frog_id, :color)
  end

end
