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

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path(@movies)
    else
      render :new
    end
  end

  private

  def movie_params
  params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
