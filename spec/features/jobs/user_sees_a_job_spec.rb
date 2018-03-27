require 'rails_helper'

describe 'User sees a specific job' do
  scenario 'a user sees a job for a specific company' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'Web Development')
    job = company.jobs.create!(
      title: 'Developer',
      level_of_interest: 70,
      city: 'Denver',
      category: category
    )

    visit company_job_path(company, job)

    expect(page).to have_content('ESPN')
    expect(page).to have_content('Developer')
    expect(page).to have_content('70')
  end
end

describe 'User clicks on a specific job' do
  scenario 'a user sees a job for a specific company when they click' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'Web Development')
    company.jobs.create!(
      title: 'Developer',
      level_of_interest: 70,
      city: 'Denver',
      category: category
    )

    visit company_path(company)
    click_link 'Developer'

    expect(page).to have_content('ESPN')
    expect(page).to have_content('Developer')
    expect(page).to have_content('70')
  end
end
