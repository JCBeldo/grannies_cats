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

  private
  def granny_params
    params.permit(:name, :has_treats, :age)
  end
end