class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def ingredient_names
    ingredients.map do |ingredient|
      ingredient.name
    end
  end

  def total_calories
    ingredients.sum {|ingredient| ingredient.calories}
  end
end
