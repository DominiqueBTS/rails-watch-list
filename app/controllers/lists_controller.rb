class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def create_bookmark
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = Movie.find(bookmark_params[:movie_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      redirect_to llist_path(@list), alert: 'Failed to save bookmark.'
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
