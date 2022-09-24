class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  layout "admin_application"

  def index
    @genres = Genre.all.page(params[:page]).per(10)
    #登録されている全てのジャンルを呼び出す
    @new_genre = Genre.new
    #index画面で新規ジャンルを登録する
  end

  def create
    @genres = Genre.all
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      flash[:notice] = "正常に追加されました"
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
