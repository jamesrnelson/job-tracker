require 'rails_helper'

describe 'User creates a new category' do
  scenario 'a user can create a new category' do
    category = Category.create!(title: 'Web development')
    visit new_category_path(category)

    fill_in 'category[title]', with: 'Database Administration'

    click_button 'Create New Category'

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content('Database Administration')
  end
end

describe 'User creates a new category from category listing' do
  scenario 'a user clicks the link to go to form' do
    category = Category.create!(title: 'finance')
    visit company_path(company)
    click_link 'Create a New Job'

    fill_in 'job[title]', with: 'Developer'
    fill_in 'job[description]', with: 'So fun!'
    fill_in 'job[level_of_interest]', with: 80
    fill_in 'job[city]', with: 'Denver'

    click_button 'Create'

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content('ESPN')
    expect(page).to have_content('Developer')
    expect(page).to have_content('80')
    expect(page).to have_content('Denver')
  end
end
