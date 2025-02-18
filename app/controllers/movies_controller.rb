class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new(params[:id])
  end

  private

  def movie_params
  params.require(movie).permit(:title, :overview, :poster_url, :rating)
  end
end
