FactoryBot.define do
  factory :course do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end