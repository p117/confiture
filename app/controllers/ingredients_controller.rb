class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end
  def new
    @ingredient = Ingredient.new
  end
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render "new"
    end
  end
  def show 
    @ingredient = Ingredient.find(params[:id])
  end
  def edit
    @ingredient = Ingredient.find(params[:id])
  end
  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update(params[:ingredient].permit(:name, :u_price))
        redirect_to @ingredient
      else
        render 'edit'
      end
  end
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
 
      redirect_to ingredients_path
    end
  def ingredient_params
    params.require(:ingredient).permit(:name, :u_price)
  end
end