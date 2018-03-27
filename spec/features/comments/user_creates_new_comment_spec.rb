require 'rails_helper'

describe 'User creates a new comment' do
  scenario 'a user can create a new comment' do
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", company: company)

    visit company_job_path(company, job)

    fill_in 'comment[body]', with: 'Chet Harper might not be my best contact, but he is who I know'

    click_button 'Create'

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content('Chet Harper might not be my best contact, but he is who I know')
  end
end
