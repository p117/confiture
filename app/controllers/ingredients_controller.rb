class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end
  def new
    @ingredient = Ingredient.new
  end
  def create
    @ingredient = Ingredient.new(post_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render "new"
    end
  end
end