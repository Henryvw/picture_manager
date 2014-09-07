class CategoriesController < ApplicationController
  before_action :require_user_session!

def new
  @category = Category.new
end

def create
  binding.pry
  @category = Category.new(category_params)
  if
    @category.save
    redirect_to collections_path
  end
end


def category_params
      params.require(:category).permit(:category)
end

end