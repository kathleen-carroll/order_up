class DishIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])

    @ingredients = @chef.dishes.map {|dish| dish.ingredients}.flatten.uniq
  end
end
