# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work_skill do
  	work_detail_id 1

  	trait :skill1 do
  		skill_id 1
  	end
  	trait :skill2 do
  		skill_id 2
  	end	
  	trait :skill3 do
  		skill_id 3
  	end
  	factory :work_skill1, traits: [:skill1]
  	factory :work_skill2, traits: [:skill2]
  	factory :work_skill3, traits: [:skill3]
  end
end
