class PracticeSession < ActiveRecord::Base
  belongs_to :repertoire
  has_many :songs, through: :repertoire
end
