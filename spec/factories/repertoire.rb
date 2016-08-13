FactoryGirl.define do
  factory :repertoire do
    sequence(:name) { |n| "Repertoire_#{n}" }
  end
end
