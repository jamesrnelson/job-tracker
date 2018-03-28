require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
  end

  describe "relationships" do
    it "has many contacts" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:contacts)
    end
  end

  describe "dependencies" do
    it 'deletes jobs it owns when deleted' do
      company = Company.create(name: 'Turing')
      category = Category.create(title: 'Web Development')
      Job.create(
        title: 'Developer',
        level_of_interest: 40,
        city: 'Denver',
        company: company,
        category: category
      )

      company.destroy

      expect(Job.count).to eq(0)
    end
  end

  describe "dependencies" do
    it 'deletes jobs it owns when deleted' do
      company = Company.create(name: 'Turing')
      company.contacts.create(name: 'Jimbo James', position: 'Jam Maker', email: 'barker@jimmer.com')
      binding.pry
      company.destroy

      expect(Contact.count).to eq(0)
    end
  end
end
