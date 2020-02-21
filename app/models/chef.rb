class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def most_popular
    query = dishes.joins(:ingredients).select('count(ingredients.id) as count, dishes.name').group('dishes.name').order(:count)
    #select (count(dishes)), ingredient from
    ingredient_count = query.reduce({}) do |hash, count|
      hash[count.name] = count[:count]
      hash
    end
    ingredient_count
  end
end
