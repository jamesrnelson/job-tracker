class DashboardController < ApplicationController
  def index
    @job75_100 = Job.count_75_and_up
    @job50_75 = Job.count_between_50_and_75
    @job25_50 = Job.count_between_25_and_50
    @job0_25 = Job.count_less_than_25
    @distinct_cities = Job.distinct_cities
    @top_three_companies = Company.top_three_companies
  end
end
