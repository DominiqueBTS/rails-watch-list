class BookmarksController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new
  end

  def create
    @movie = Movie.find(params[:movie_id]) # Find the associated movie
    @bookmark = Bookmark.new(bookmark_params) # Build a new bookmark for the movie
    @bookmark.movie = @movie

    if @bookmark.save
      redirect_to movies_path
    else
      redirect movie_path(@movie)
    end
  end

  def delete
    @movie = Movie.find(params[:movie_id])  # Find the associated movie
    @bookmark = Bookmark.find(params[:id])   # Find the existing bookmark

    if @bookmark.destroy
      redirect_to movies_path  # Redirect on successful deletion
    else
      redirect_to movie_path(@movie)  # Redirect back on failure
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :list_id, :movie_id, :comment)
  end
end
