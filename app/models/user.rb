class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :personalized_trainers, dependent: :destroy
  # has_one :personalized_trainer, through: booking # one or many?

  # validations for user attributes?
end
