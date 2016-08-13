FactoryGirl.define do
  factory :instrument do
    sequence(:name) { |n| "Instrument_#{n}" }
    key 'C'
  end
end
