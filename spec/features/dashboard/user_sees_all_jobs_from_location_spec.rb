require 'rails_helper'

describe 'User' do
  context 'clicks on city' do
    it 'should take user to a page with only jobs from that city' do
      company1 = Company.create!(name: 'ESPN')
      category1 = Category.create!(title: 'Web Development')
      company1.jobs.create!(
        title: 'Developer',
        level_of_interest: 70,
        city: 'Denver',
        category: category1
      )

      company2 = Company.create!(name: 'Wordpress')
      category2 = Category.create!(title: 'Editor')
      company2.jobs.create!(
        title: 'Lead Editor',
        level_of_interest: 70,
        city: 'Milwaukee',
        category: category2
      )

      visit root_path

      expect(page).to have_content('Denver')
      expect(page).to have_content('Milwaukee')

      click_on 'Denver'

      expect(page).to have_content('Denver')
      expect(page).to_not have_content('Milwaukee')
    end
  end
end
