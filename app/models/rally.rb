class Rally < ActiveRecord::Base
  include Slugable
  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
end
