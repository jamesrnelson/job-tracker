require 'rails_helper'

describe "User edits an existing contact" do
  scenario "a user can edit a contact" do
    company = Company.create!(name: "ESPN")
    contact = company.contacts.create!(name: 'Bleep Blorp McGorp', position: 'Head Beeper', email: 'bleep@blorp.com')
    visit company_path(company)

    click_on "Edit"

    fill_in "contact[name]", with: "Greg Richards"
    fill_in "contact[position]", with: "Chief Boring Officer"
    fill_in "contact[email]", with: "choring@biefing.com"
    click_button "Update"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("Greg Richards")
    expect(page).to_not have_content("Bleep Blorp McGorp")
  end
end
