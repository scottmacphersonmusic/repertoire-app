FactoryGirl.define do
  factory :song do
    sequence(:title) { |n| "Song_#{n}" }
    key "C"
    quality "major"
    comfort (0..5).to_a.sample
  end
end
