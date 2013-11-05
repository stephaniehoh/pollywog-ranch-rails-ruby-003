class PondsController < ApplicationController

  def index
    @ponds = Pond.all

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @ponds }
    # end
  end 

  def create
    @pond = Pond.new(pond_params)
    @pond.save
    redirect_to('/ponds')
  end

  def show
    @pond = Pond.find(params[:id])
  end

  def new
    @pond = Pond.new
  end

  def edit
    @pond = Pond.find(params[:id])
  end

  def update
    @pond = Pond.find(params[:id])
    @pond.update(pond_params)
    redirect_to('/ponds')
  end

  def destroy
    @pond = Pond.find(params[:id])
    @pond.destroy
    redirect_to('/ponds')
  end

###### Strong Params ######  
  
  private

  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end

end
