# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_skill do
  	level 2
    association :employee
    association :skill

    factory :employee_skill_first
  end
end
