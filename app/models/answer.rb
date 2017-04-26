class Answer < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :votes, as: :votables
  belongs_to :question, :user

  validates :description, presence: true

end
