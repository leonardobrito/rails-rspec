# frozen_string_literal: true

FactoryBot.define do
  factory :customer, aliases: [:user] do
    # transient do
    #   upcased { false }
    # end

    name { Faker::Name.name }
    email { Faker::Internet.email }
    # sequence(:email) { |n| "my_email-#{n}@email.com" }
    # sequence(:email, 32) { |n| "my_email-#{n}@email.com" }
    # sequence(:email, 'a') { |n| "my_email-#{n}@email.com" }
    # gender %w[Male Female].sample

    # factory :customer_male do
    #   gender { 'Male' }
    # end

    # factory :customer_female do
    #   gender { 'Female' }
    # end

    trait :male do
      gender { 'Male' }
    end

    trait :female do
      gender { 'Female' }
    end

    # inheritance
    # factory :customer_vip do
    #   vip { true }
    #   days_to_pay { 30 }
    # end

    # factory :customer_default do
    #   vip { false }
    #   days_to_pay { 15 }
    # end
    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    factory :customer_male, traits: [:male]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_female, traits: [:female]
    factory :customer_male_vip, traits: %i[male vip]
    factory :customer_female_vip, traits: %i[female vip]
    factory :customer_male_default, traits: %i[male default]
    factory :customer_female_default, traits: %i[female default]
  end

  # after(:create) do |customer, evaluator|
  #   customer.name.upcase! if evaluator.upcased
  # end
end
