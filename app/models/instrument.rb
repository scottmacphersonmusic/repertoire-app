class Instrument < ActiveRecord::Base
  validates :name, presence: true
  validates :key, presence: true
end
