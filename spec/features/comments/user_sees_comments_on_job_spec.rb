require 'rails_helper'

describe "User views a job page" do
  scenario "a user sees a comment section" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", company: company)
    comment = Comment.new(body: 'This is the body', job: job)
    comment2 = Comment.new(body: 'Esta es una body', job: job)

    visit company_job_path(company, job)
    binding.pry
    expect(page).to have_content('Comments:')
    expect(page).to have_content(comment.body)
    expect(page).to have_content(comment2.body)
  end
end
