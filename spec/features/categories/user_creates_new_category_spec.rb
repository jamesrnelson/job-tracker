require 'rails_helper'

describe 'User creates a new category' do
  scenario 'a user can create a new category' do
    visit new_category_path

    fill_in 'category[title]', with: 'Database Administration'

    click_button 'Create'

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content('Database Administration')
  end
end

describe 'User creates a new category from category listing' do
  scenario 'a user clicks the link to go to form' do
    visit categories_path
    click_link 'Create a New Category'

    fill_in 'category[title]', with: 'Database Administration'

    click_button 'Create'

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content('Database Administration')
  end
end
