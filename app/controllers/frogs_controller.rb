class FrogsController < ApplicationController

  def index
    @frogs = Frog.all

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @frogs }
    # end
  end 

  def create
    @frog = Frog.new(frog_params)
    @frog.save
    redirect_to('/frogs')
  end

  def show
    @frog = Frog.find(params[:id])
  end

  def new
    @ponds = Pond.all
    @frog = Frog.new
  end

  def edit
    @frog = Frog.find(params[:id])
    @ponds = Pond.all
  end

  def update
    @frog = Frog.find(params[:id])
    @frog.update(frog_params)
    redirect_to('/frogs')
  end

  def destroy
    @frog = Frog.find(params[:id])
    @frog.destroy
    redirect_to('/frogs')
  end

  
###### Strong Params ######  

  private

  def frog_params
    params.require(:frog).permit(:name, :pond_id, :color)
  end


  # # GET '/frogs/:id/tadpoles/new'
  # get '/frogs/:id/tadpoles/new' do
  #   @frog = Frog.find_by(:id => params[:id].to_i)
  #   erb :'tadpoles/new'
  # end


end
