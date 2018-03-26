require 'rails_helper'

describe "User" do
  context "visits a job's page and clicks edit" do
    it "should be able to fill in the edit form" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

      visit company_path(company)
      click_on 'Developer'
      click_on 'Edit Job'
      fill_in 'Title', with: 'Sportscaster'
      fill_in 'level_of_interest', with: 99
      fill_in 'city', with: 'New York City'
      click_on 'Update Job'

      expect(page).to have_content("Sportscaster")
      expect(page).to have_content("99")
      expect(page).to have_content("New York City")
    end
  end
end
