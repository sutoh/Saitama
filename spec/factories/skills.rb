# -*- encoding: utf-8 -*-
FactoryGirl.define do
  factory :skill do
    name "skill"
    category 0
    note "none"
    trait :ruby do
      name "ruby"
      category 1
    end
  end
end
