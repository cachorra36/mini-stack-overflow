class Answer < ActiveRecord::Base
  has_many :votes, as: :vote_type
  belongs_to :question
end
