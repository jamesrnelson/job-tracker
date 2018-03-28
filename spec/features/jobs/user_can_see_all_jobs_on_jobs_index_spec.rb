require 'rails_helper'

describe 'User sees all jobs' do
  scenario 'a user sees all jobs on jobs#index' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'Web Development')
    company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category: category)
    company.jobs.create!(title: 'Getter who gets', level_of_interest: 100, city: 'Danver', category: category)


    visit jobs_path

    expect(page).to have_content('Denver')
    expect(page).to have_content('Danver')
    expect(page).to have_content('Developer')
    expect(page).to have_content('Getter who gets')
  end
end
