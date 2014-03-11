class Truck < ActiveRecord::Base
  include Slugable
  validates :name, presence: true
end
