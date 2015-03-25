class Question < ActiveRecord::Base
  before_save :default_values
  belongs_to :user
  def default_values
    self.votes ||= 0
  end 
end
