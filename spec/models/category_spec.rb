require 'rails_helper'

describe Category do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        category = Category.new(title: nil)
        expect(category).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a title' do
        category = Category.new(title: 'Developer')
        expect(category).to be_valid
      end

      it 'is only valid if it is unique' do
        category1 = Category.create(title: 'Developer')
        category2 = Category.create(title: 'I-Banking')
        category3 = Category.create(title: 'I-Banking')

        expect(category1).to be_valid
        expect(category2).to be_valid
        expect(category3).to_not be_valid
      end
    end
  end
end
