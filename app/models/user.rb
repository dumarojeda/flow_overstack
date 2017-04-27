class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #we don't need this association because the user doesn't belong to many models; it HAS many models. Otherwise, we would need to use this polymorphic: belongs_to :userable, :polymorphic => true

  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  validates :email, :uniqueness => true, :format => {:with => /\A\b[A-Z0-9\.\_\%\-\+]+@(?:[A-Z0-9\-]+\.)+[A-Z]{2,6}\b\z/i}

  #Include gem for Gravatar
  include Gravtastic
  gravtastic
end
