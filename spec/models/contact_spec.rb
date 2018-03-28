require 'rails_helper'

describe Contact do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a name, position, and email' do
        contact1 = Contact.new(name: 'Steve', position: 'This is the position')
        contact2 = Contact.new(name: 'Steve', email: 'weave@steve.com')
        contact3 = Contact.new(position: 'This is the position', email: 'weave@steve.com')
        expect(contact1).to be_invalid
        expect(contact2).to be_invalid
        expect(contact3).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a name, position, and email' do
        company = Company.new(name: "Turing")
        contact = company.contacts.new(name: 'Steve', position: 'This is the position', email: 'email@stemail.com')
        expect(contact).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a company' do
      company = Company.new(name: "Turing")
      contact = company.contacts.new(name: 'Steve', position: 'This is the position', email: 'email@stemail.com')
      expect(contact).to respond_to(:company)
    end
  end
end
