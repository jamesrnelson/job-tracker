require 'rails_helper'

describe Job do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        job = Job.new(level_of_interest: 80, description: 'Wahoo', city: 'Denver')
        expect(job).to be_invalid
      end

      it 'is invalid without a level of interest' do
        job = Job.new(title: 'Developer', description: 'Wahoo', city: 'Denver')
        expect(job).to be_invalid
      end

      it 'is invalid without a city' do
        job = Job.new(title: 'Developer', description: 'Wahoo', level_of_interest: 80)
        expect(job).to be_invalid
      end

      it 'is invalid without a category' do
        job = Job.new(
          title: 'Developer',
          description: 'Wahoo',
          level_of_interest: 80,
          city: 'Denver')

        expect(job).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a title, level of interest, company, and caetegory' do
        company = Company.new(name: 'Turing')
        category = Category.new(title: 'Web Development')
        job = Job.new(
          title: 'Developer',
          level_of_interest: 40,
          city: 'Denver',
          company: company,
          category: category
        )
        expect(job).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a company' do
      company = Company.new(name: 'Turing')
      category = Category.new(title: 'Web Development')
      job = Job.new(
        title: 'Developer',
        level_of_interest: 40,
        city: 'Denver',
        company: company,
        category: category
      )
      expect(job).to respond_to(:category)
    end
  end

  describe 'relationships' do
    it 'belongs to a category' do
      company = Company.new(name: 'Turing')
      category = Category.new(title: 'Web Development')
      job = Job.new(
        title: 'Developer',
        level_of_interest: 40,
        city: 'Denver',
        company: company,
        category: category
      )
      expect(job).to respond_to(:category)
    end
  end

  describe 'relationships' do
    it 'has many comments' do
      company = Company.new(name: 'Turing')
      category = Category.new(title: 'Web Development')
      job = Job.new(
        title: 'Developer',
        level_of_interest: 40,
        city: 'Denver',
        company: company,
        category: category
      )
      expect(job).to respond_to(:comments)
    end
  end


  describe 'comment order' do
    it 'has comments sorted newest to oldest' do
      company = Company.create(name: 'Turing')
      category = Category.create(title: 'Web Development')
      job = Job.create(
        title: 'Developer',
        level_of_interest: 40,
        city: 'Denver',
        company: company,
        category: category
      )
      job.comments.create(body: 'A comment')
      job.comments.create(body: 'Another comment')

      expect(job.comment_order.first.body).to eq('Another comment')
    end
  end

  describe "dependencies" do
    it 'deletes comments it owns when deleted' do
      company = Company.create(name: 'Turing')
      category = Category.create(title: 'Web Development')
      job = Job.create(
        title: 'Developer',
        level_of_interest: 40,
        city: 'Denver',
        company: company,
        category: category
      )

      job.comments.create(body: 'Commentiment')
      job.destroy

      expect(Comment.count).to eq(0)
    end
  end

  describe "methods" do
    it 'returns jobs with score in range' do
      company = Company.create(name: 'Turing')
      category = Category.create(title: 'Web Development')
      Job.create(
        title: 'Developer',
        level_of_interest: 40,
        city: 'Denver',
        company: company,
        category: category
      )
      Job.create(
        title: 'Developer2',
        level_of_interest: 70,
        city: 'Denver',
        company: company,
        category: category
      )
      Job.create(
        title: 'Developer3',
        level_of_interest: 72,
        city: 'Denver',
        company: company,
        category: category
      )
      Job.create(
        title: 'Developer4',
        level_of_interest: 90,
        city: 'Denver',
        company: company,
        category: category
      )

      expect(Job.count_75_and_up).to eq(1)
      expect(Job.count_between_50_and_75).to eq(2)
      expect(Job.count_between_25_and_50).to eq(1)
      expect(Job.count_less_than_25).to eq(0)
    end
  end

  describe "method#jobs_in_city" do
    it 'returns jobs with score in range' do
      company = Company.create(name: 'Turing')
      category = Category.create(title: 'Web Development')
      Job.create(
        title: 'Developer',
        level_of_interest: 40,
        city: 'Denver',
        company: company,
        category: category
      )
      Job.create(
        title: 'Developer2',
        level_of_interest: 70,
        city: 'Danver',
        company: company,
        category: category
      )
      Job.create(
        title: 'Developer3',
        level_of_interest: 72,
        city: 'Memphis',
        company: company,
        category: category
      )
      Job.create(
        title: 'Developer4',
        level_of_interest: 90,
        city: 'Denver',
        company: company,
        category: category
      )

      expect(Job.jobs_in_city('Denver').count).to eq(2)
      expect(Job.jobs_in_city('Danver').count).to eq(1)
    end
  end

  describe "method#jobs_in_city" do
    it 'returns jobs with score in range' do
      company = Company.create(name: 'Turing')
      category = Category.create(title: 'Web Development')
      Job.create(
        title: 'Developer',
        level_of_interest: 40,
        city: 'Denver',
        company: company,
        category: category
      )
      Job.create(
        title: 'Developer2',
        level_of_interest: 70,
        city: 'Danver',
        company: company,
        category: category
      )
      Job.create(
        title: 'Developer3',
        level_of_interest: 72,
        city: 'Memphis',
        company: company,
        category: category
      )
      Job.create(
        title: 'Developer4',
        level_of_interest: 90,
        city: 'Denver',
        company: company,
        category: category
      )

      expect(Job.distinct_cities).to include('Denver')
      expect(Job.distinct_cities).to include('Danver')
      expect(Job.distinct_cities).to include('Memphis')
    end
  end
end
