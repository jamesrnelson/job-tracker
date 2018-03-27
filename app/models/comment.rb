#app/models/comment.rb

class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :job
end
