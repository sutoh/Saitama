# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work do
    employee_id 1
  	sales_staff_id 1

    trait :customer1 do
      customer_id 1
    end
    trait :customer2 do
      customer_id 2
    end
    trait :customer3 do
      customer_id 3
    end

    factory :work1, traits: [:customer1]
    factory :work2, traits: [:customer2]
    factory :work3, traits: [:customer3]
  end
end
