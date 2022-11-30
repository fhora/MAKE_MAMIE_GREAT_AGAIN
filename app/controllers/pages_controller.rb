class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def user
    @user = User.find(params[:id])
    @review = Review.new
  end
end
