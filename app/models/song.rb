class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :key, presence: true

  belongs_to :repertoire
end
