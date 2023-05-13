class Grannies::CatsController < ApplicationController
  def index
    @granny = Granny.find(params[:id])
    @cats = @granny.sort_aplha(params['sort'])
  end
  
  def new
    @granny = Granny.find(params[:id])
  end

  def create
    granny = Granny.find(params[:id])
    cat = granny.cats.create!(cat_params)

    redirect_to "/grannies/#{granny.id}/cats"
  end

  
  private
  def cat_params
    params.permit(:name, :spayed_neutered, :lives)
  end
end