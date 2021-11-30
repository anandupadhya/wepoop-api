class Api::V1::ToiletsController < Api::V1::BaseController
  before_action :set_toilet, only: [:show]
  def index
    @toilets = Toilet.all
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
end
