class Trait < ActiveRecord::Base
  has_many :user_traits
  has_many :events
  has_many :records
end
