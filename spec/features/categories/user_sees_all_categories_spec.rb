require 'rails_helper'

describe 'User sees all categories' do
  scenario 'a user sees all the categories' do
    category = Category.create!(description: 'Web Development')
    category_two = Category.create!(description: 'Database Administrator')

    visit categories_path

    expect(page).to have_content(category.description)
    expect(page).to have_content(category_two.description)
  end
end
