class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :vote_type, dependent: :destroy
  has_many :answers, dependent: :destroy
end
