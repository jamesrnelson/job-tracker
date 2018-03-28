require 'rails_helper'

describe 'User creates a new contact' do
  scenario 'a user can create a new contact' do
    company = Company.create!(name: 'ESPN')

    visit company_path(company)

    fill_in 'contact[name]', with: 'Bleep Blorp McGorp'
    fill_in 'contact[position]', with: 'Head Beeper'
    fill_in 'contact[email]', with: 'bleep@blorp.com'

    click_button 'Create'

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content('Bleep Blorp McGorp')
  end
end
