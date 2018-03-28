class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_three_companies
    joins(:jobs)
    .group(:id)
    .order('avg(level_of_interest) desc')[0..2]
  end

  def average_level_of_interest
    jobs.average(:level_of_interest)
  end 
end
