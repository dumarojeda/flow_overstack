class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #we don't need this association because the user doesn't belong to many models; it HAS many models. Otherwise, we would need to use this polymorphic: belongs_to :userable, :polymorphic => true

end
