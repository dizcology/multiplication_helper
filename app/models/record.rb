class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :event
end