require 'rails_helper'

describe 'User' do
  context "visits a job's page and clicks edit" do
    it 'should be able to fill in the edit form' do
      company = Company.create!(name: 'ESPN')
      company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver')

      visit company_path(company)
      click_on 'Developer'
      click_on 'Edit Job'

      fill_in 'Title', with: 'Sportscaster'
      fill_in 'Description', with: 'Talk to the camera.'
      fill_in 'Level of interest', with: 99
      fill_in 'City', with: 'New York City'
      click_on 'Update Job'

      expect(page).to have_content('Sportscaster')
      expect(page).to have_content('Talk to the camera.')
      expect(page).to have_content('99')
      expect(page).to have_content('New York City')
      expect(page).to have_content("Job 'Sportscaster' was updated.")
    end
  end
end

describe 'User' do
  context "visits an edit page but doesn't provide required info" do
    it 'should redirect to edit page' do
      company = Company.create!(name: 'ESPN')
      company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver')

      visit company_path(company)
      click_on 'Developer'
      click_on 'Edit Job'
      fill_in 'Title', with: 'Sportscaster'
      fill_in 'Description', with: nil
      click_on 'Update Job'

      expect(page).to have_content('Edit the job')
    end
  end
end
