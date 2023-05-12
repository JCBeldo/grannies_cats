class GranniesController < ApplicationController
  def index
    @grannies = Granny.all
  end

  def show
    @granny = Granny.find(params[:id])
  end

  def new
  
  end

  def create
    granny = Granny.create(granny_params)
    redirect_to "/grannies"
  end

  def edit
    @granny = Granny.find(params[:id])
  end

  def update
    granny = Granny.find(params[:id])
    granny.update(granny_params)
    
    redirect_to "/grannies/#{granny.id}"
  end

  private
  def granny_params
    params.permit(:name, :has_treats, :age)
  end
end