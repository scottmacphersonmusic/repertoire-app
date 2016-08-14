FactoryGirl.define do
  factory :suggestion do
    sequence(:song_title) { |n | "song_title_#{n}" }
    key "C"
    instrument "Piano"
  end
end
