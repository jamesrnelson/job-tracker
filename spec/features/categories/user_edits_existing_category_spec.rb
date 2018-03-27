require 'rails_helper'

describe 'User edits an existing category' do
  scenario 'a user can edit a category' do
    category = Category.create!(title: 'Boring desk job')
    visit edit_category_path(category)

    fill_in 'category[title]', with: 'Exciting Programming Job'
    click_button 'Update'

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content('Exciting Programming Job')
    expect(page).to_not have_content('Boring desk job')
  end
end
