require 'rails_helper'

RSpec.describe 'As a visitor when i go to dish show page' do
  it 'should have name of chef who made the dish and ingredients and total calories for dish' do
    shaya = Chef.create(name: "Alon Shaya")
    chickpea = Ingredient.create(name: "Chickpea", calories: "100")
    olive_oil = Ingredient.create(name: "Olive Oil", calories: "40")
    pine_nut = Ingredient.create(name: "Pine Nut", calories: "60")
    hummus = shaya.dishes.create(name: "Hummus",
                                 description: "Creamy dip for veggies and pita",
                                 ingredients: [chickpea, olive_oil, pine_nut])
    total_cals = chickpea.calories + olive_oil.calories + pine_nut.calories

    visit "/dishes/#{hummus.id}"

    expect(page).to have_content("#{hummus.name}")
    expect(page).to have_content("Chef: #{shaya.name}")
    expect(page).to have_content("Ingredients: #{chickpea.name}, #{olive_oil.name}, and #{pine_nut.name}")
    expect(page).to have_content("Total Calories: #{total_cals}")
  end
end
