class UserSolutionXref < ActiveRecord::Base
  attr_accessible :user_id, :solution_id, :line_max

  belongs_to :user
  belongs_to :solution

  validates :line_max, :presence => true,
            :numericality => {:only_integer => true}
end
