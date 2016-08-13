FactoryGirl.define do
  factory :repertoire do |f|
    f.sequence(:name) {|n| "Repertoire #{n}"}
  end
end
