class Api::V1::ReviewsController < Api::V1::BaseController
  def new
    @toilet = Toilet.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :toilet_id, :happy, :status, :comment)
  end
end
