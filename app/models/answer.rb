class Answer < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :question
  belongs_to :user

  validates :description, presence: true

end
