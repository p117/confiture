class HistoricsController < ApplicationController
  def index
  	@products = ProductHistoric.all
  	@ingredients = IngredientHistoric.all
  end
end