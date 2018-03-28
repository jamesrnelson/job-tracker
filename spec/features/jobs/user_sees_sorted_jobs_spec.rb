require 'rails_helper'

describe "User views a job sort page" do
  scenario "a user sees jobs sorted by city" do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'Web Development')
    company.jobs.create!(
      title: 'Developer',
      level_of_interest: 70,
      city: 'Denver',
      category: category
    )

    company.jobs.create!(
      title: 'MeepMorper',
      level_of_interest: 40,
      city: 'Austin',
      category: category
    )

    company.jobs.create!(
      title: 'Leaper Loper',
      level_of_interest: 100,
      city: 'Bangkok',
      category: category
    )

    visit jobs_path

    click_link "Sort All Jobs by City"

    within ".index_0" do
      expect(page).to have_content('Austin')
    end
  end

  scenario "a user sees jobs sorted by interest" do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'Web Development')
    company.jobs.create!(
      title: 'Developer',
      level_of_interest: 70,
      city: 'Denver',
      category: category
    )

    company.jobs.create!(
      title: 'MeepMorper',
      level_of_interest: 40,
      city: 'Austin',
      category: category
    )

    company.jobs.create!(
      title: 'Leaper Loper',
      level_of_interest: 100,
      city: 'Bangkok',
      category: category
    )

    visit jobs_path

    click_link "Sort All Jobs by Interest Level"

    within ".index_0" do
      expect(page).to have_content('Bangkok')
    end
  end
end
