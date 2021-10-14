class RanksController < ApplicationController
  def index
    reviewAverage = Review.group(:post_id).average(:star)
    @sortReviewAverage =reviewAverage.sort_by { |_, v| v }.reverse.to_h
    @posts = Post.all
  end
  
end
