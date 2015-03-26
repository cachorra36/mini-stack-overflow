class Question < ActiveRecord::Base
	has_many :answers, dependent: :destroy
  has_many :votes, as: :votable
	accepts_nested_attributes_for :answers
end
