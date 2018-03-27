require 'rails_helper'

describe "User deletes a job" do
  scenario "a user can delete a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'Web Development')
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_jobs_path(company)

    click_link "Delete"

    expect(page).to have_content(company.name)
    expect(page).to_not have_content(job.title)
  end
end
