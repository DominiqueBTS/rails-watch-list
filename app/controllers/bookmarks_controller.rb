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

  def destroy
    @bookmark = Bookmark.find(params[:id])  # Find the bookmark by its ID
    if @bookmark.destroy
      redirect_to list_path(@bookmark.list)  # Redirect back to the associated list
    else
      redirect_to list_path(@bookmark.list), alert: 'Failed to delete bookmark.'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :list_id, :movie_id, :comment)
  end
end
