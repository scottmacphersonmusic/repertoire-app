class Repertoire < ActiveRecord::Base
  validates :name, presence: true

  has_many :songs
  has_many :practice_sessions
end
