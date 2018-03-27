require 'rails_helper'

describe 'User sees all categories' do
  scenario 'a user sees all the categories' do
    category = Category.create!(title: 'Web Development')
    category_two = Category.create!(title: 'Database Administrator')

    visit categories_path

    expect(page).to have_content(category.title)
    expect(page).to have_content(category_two.title)
  end
end
