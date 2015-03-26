class Vote < ActiveRecord::Base
  validates_numericality_of :value, numericality: { message: "You van only vote once" }, in: -1..1
  belongs_to :vote_type, polymorphic: true
  belongs_to :user
  # validates :sum_of_values


  # def sum_of_values(amount)
  #   unless (amount + self.value).between?(-1,1) 
  #   	errors.add(message: "You can not vote on that direction")
  #   end
  # end

  # def amount
  #   vote_value = User.find(user_id).votes.where(vote_type_type: vote_type_local, vote_type_id: vote_type_id_local).sum(:value)
  # end

  # def amount(votes)
  # 	votes.sum(:value)
  # end



end
