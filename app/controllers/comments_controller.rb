class CommentsController < ApplicationController
  def index
    @comments = Comment.order(:id)
    
    binding.pry
    
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
