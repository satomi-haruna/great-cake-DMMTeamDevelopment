class GenresController < ApplicationController

  def index
    @genre = Genre.new
    #index画面で新規ジャンルを登録する
    @genres = Genre.all
    #登録されている全てのジャンルを呼び出す
  end

  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルが追加されました"
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "正常に変更されました"
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
