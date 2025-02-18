class ListController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @list = List.new
  end
end
