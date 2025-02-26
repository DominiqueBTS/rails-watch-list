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
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list #get the list before deleting the bookmark.
    @bookmark.destroy

    redirect_to list_path(@list), notice: 'Bookmark was successfully deleted.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :list_id, :movie_id, :comment)
  end
end
