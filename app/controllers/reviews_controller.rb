class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    @user = User.find(params[:user_id])
    @review.user = @user
    authorize @review
    if @review.save
      redirect_to userpage_path(@user)
    else
      render 'pages/user', status: :unprocessable_entity
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating, :user_id, :reviewer_id)
  end
end
