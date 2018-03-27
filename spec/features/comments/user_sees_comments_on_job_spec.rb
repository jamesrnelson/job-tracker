require 'rails_helper'

describe "User views a job page" do
  scenario "a user sees a comment section" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", company: company)
    comment = job.comments.create(body: 'This is the body')
    comment2 = job.comments.create(body: 'Esta es una body')

    visit company_job_path(company, job)

    expect(page).to have_content('Comments:')
    expect(page).to have_content(comment.body)
    expect(page).to have_content(comment2.body)
  end
end
