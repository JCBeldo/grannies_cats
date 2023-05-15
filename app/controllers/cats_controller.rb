class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    cat = Cat.find(params[:id])
    cat.update(cat_params)

    redirect_to "/cats/#{cat.id}"
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy

    redirect_to "/cats"
  end

  private
  def cat_params
    params.permit(:spayed_neutered, :lives)
  end
end