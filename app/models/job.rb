class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.count_75_and_up
    all.where(level_of_interest: 75..200).count
  end

  def self.count_between_50_and_75
    all.where(level_of_interest: 50...75).count
  end

  def self.count_between_25_and_50
    all.where(level_of_interest: 25...50).count
  end

  def self.count_less_than_25
    all.where(level_of_interest: 0...25).count
  end

  def self.jobs_in_city(location)
    all.where(city: location)
  end

  def self.distinct_cities
    distinct.pluck(:city)
  end

  def comment_order
    comments.reverse
  end
end
