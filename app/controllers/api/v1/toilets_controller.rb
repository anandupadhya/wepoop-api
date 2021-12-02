class Api::V1::ToiletsController < Api::V1::BaseController
  before_action :set_toilet, only: [:show]
  def index
    @toilets = Toilet.near([params["latitude"], params["longitude"]], 2)
    @toilets.each { |toilet| toilet.distance = (toilet.distance * 1000).round(1) }
  end

  def show
  end

  def create
    @toilet = Toilet.new(toilet_params)
    if @toilet.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end

  def toilet_params
    params.require(:toilet).permit(:address, :latitude, :longitude, :accessibility, :changing_station, :directions, :male, :female, :approved, :description, :user_id)
  end

  def render_error
    render json: { errors: @toilet.errors.full_messages },
      status: :unprocessable_entity
  end
end
