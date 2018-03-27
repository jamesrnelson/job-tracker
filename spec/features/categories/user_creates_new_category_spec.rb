require 'rails_helper'

describe 'User' do
  context 'goes to categories page and' do
    it 'makes a new category' do
      category = Category.new(description: 'Web development')
    end
  end
end
