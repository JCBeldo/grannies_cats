class Grannies::CatsController < ApplicationController
  def index
    @granny = Granny.find(params[:id])
  end
end