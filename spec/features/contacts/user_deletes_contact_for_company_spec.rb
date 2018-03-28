require 'rails_helper'

describe "User deletes a contact" do
  scenario "a user can delete a contact" do
    company = Company.create!(name: "ESPN")
    contact = company.contacts.create!(name: 'Bleep Blorp McGorp', position: 'Head Beeper', email: 'bleep@blorp.com')

    visit company_path(company)

    click_link "Delete"

    expect(page).to have_content(company.name)
    expect(page).to_not have_content(contact.name)
  end
end
