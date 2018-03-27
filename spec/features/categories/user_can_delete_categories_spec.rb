require 'rails_helper'

describe 'User deletes a category' do
  scenario 'a user can delete a category' do
    category = Category.create(title: 'Human calculator')

    visit categories_path

    expect(page).to have_content(category.title)

    click_link 'Delete'

    expect(page).to_not have_content(category.title)
  end
end
