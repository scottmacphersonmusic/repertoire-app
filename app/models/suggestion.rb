class Suggestion < ActiveRecord::Base
  belongs_to :practice_session

  def songs
    practice_session.songs
  end
end
