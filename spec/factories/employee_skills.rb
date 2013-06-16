# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_skill do
  	level 2
    association :employee
    association :skill

    trait :skill1 do
      association :skill, factory: :skill_ruby
    end
    trait :skill2 do
    association :skill, factory: :skill_rails
    end
    trait :skill3 do
      association :skill, factory: :skill_java
    end

    factory :employee_skill1, traits: [:skill1]
    factory :employee_skill2, traits: [:skill2]
    factory :employee_skill3, traits: [:skill3]
  end
end
