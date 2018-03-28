require 'rails_helper'

describe 'User' do
  context 'visits root' do
    it 'should display dashboard' do
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
      company3 = Company.create!(name: 'The Nationals')
      category3 = Category.create!(title: 'Website Designer')
      company3.jobs.create!(
        title: 'Assistant Designer',
        level_of_interest: 70,
        city: 'Washington, D.C.',
        category: category3
      )

      visit root_path

      expect(page).to have_content('All You Need to Know About Jobs')
    end
  end
end
