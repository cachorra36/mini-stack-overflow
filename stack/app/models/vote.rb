class Vote < ActiveRecord::Base
  validates :amount, numericality: { greater_than: -2, less_than: 2, scope: :vote_type_id, scope: :user_id, scope: :vote_type_type, message: "You van only vote once" }
  belongs_to :vote_type, polymorphic: true

  def amount(user_id, vote_type_id, vote_type_type)
    sum = User.user_id.questions.vote_type_type(vote_type_id).votes.sum(:value)
    return sum
  end

end
