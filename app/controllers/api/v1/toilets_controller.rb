class Api::V1::ToiletsController < Api::V1::BaseController
  before_action :set_toilet, only: [:show]
  def index
    @toilets = Toilet.near([params["latitude"], params["longitude"]], 2)
    @toilets[0].distance = (@toilets[0].distance * 1000).round(1)

    @nearest_happy_reviews = Review.where(toilet_id: toilet[0].id, happy: true).count
    @nearest_unhappy_reviews = Review.where(toilet_id: toilet[0].id, happy: false).count

    sw_corner = [params["sw_latitude"], params["sw_longitude"]]
    ne_corner = [params["ne_latitude"], params["ne_longitude"]]
    @bounded_toilets = Toilet.within_bounding_box(sw_corner, ne_corner)

    @bounded_toilet_distances = []
    @happy_reviews = []
    @unhappy_reviews = []
    @bounded_toilets.each do |toilet|
      @bounded_toilet_distances << Geocoder::Calculations.distance_between([params["latitude"], params["longitude"]], [toilet["latitude"], toilet["longitude"]])
      @happy_reviews << Review.where(toilet_id: toilet.id, happy: true).count
      @unhappy_reviews << Review.where(toilet_id: toilet.id, happy: false).count
    end
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
