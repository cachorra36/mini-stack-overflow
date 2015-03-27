class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true

  def self.counter(votes)
    counter = 0
    votes.each do |vote|
      if vote.value == true
        counter += 1
      else
        counter -= 1
      end
    end
    counter
  end


end
