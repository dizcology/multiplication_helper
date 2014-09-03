class Item < ActiveRecord::Base
  has_many :events
  has_many :records, through: :events
end
