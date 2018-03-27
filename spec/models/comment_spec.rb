require 'rails_helper'

describe Comment do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a body' do
        comment = Comment.new(body: 'This is the body')
        expect(comment).to be_invalid
      end


      it 'is invalid without a city' do
        comment = Comment.new(body: 'This is the body')
        expect(comment).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a body' do
        job = Job.new(title: 'Developer', level_of_interest: 40, city: 'Denver', company: company)
        comment = Comment.new(body: 'This is the body')

        expect(comment).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a job' do
      comment = Comment.new(body: 'This is the body')
      expect(comment).to respond_to(:job)
    end
  end
end
