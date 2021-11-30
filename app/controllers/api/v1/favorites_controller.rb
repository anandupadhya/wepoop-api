class Api::V1::FavoritesController < Api::V1::BaseController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new
    @favorite.toilet_id = params[:toilet_id]
    @favorite.user_id = current_user.id
    @favorite.save
  end
end
