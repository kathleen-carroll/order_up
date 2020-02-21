require 'rails_helper'

RSpec.describe 'As a visitor when i go to chef show page' do
  it 'should have name of chef, a link to all ingredients they use and link goes to chef ingredient index page' do
    shaya = Chef.create(name: "Alon Shaya")
    chickpea = Ingredient.create(name: "Chickpea", calories: "100")
    olive_oil = Ingredient.create(name: "Olive Oil", calories: "40")
    pine_nut = Ingredient.create(name: "Pine Nut", calories: "60")
    garlic = Ingredient.create(name: "Garlic", calories: "10")
    parsley = Ingredient.create(name: "Parsley", calories: "5")

    hummus = shaya.dishes.create(name: "Hummus",
                                 description: "Creamy dip for veggies and pita",
                                 ingredients: [chickpea, olive_oil, pine_nut])
    falafel = shaya.dishes.create(name: "Falafel",
                                 description: "Crispy fried chickpea balls",
                                 ingredients: [chickpea, olive_oil, garlic, parsley])

    visit "/chefs/#{shaya.id}"

    expect(page).to have_content("#{shaya.name}")
    expect(page).to have_link("See Ingredients")
    click_on "See Ingredients"
    expect(current_path).to eq("/chefs/#{shaya.id}/ingredients")

    expect(page).to have_content("#{chickpea.name}")
    expect(page).to have_content("#{olive_oil.name}")
    expect(page).to have_content("#{pine_nut.name}")
    expect(page).to have_content("#{garlic.name}")
    expect(page).to have_content("#{parsley.name}")
  end
end
