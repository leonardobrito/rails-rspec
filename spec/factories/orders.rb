# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    sequence(:description) { |number| "Order number - #{number}" }
    customer
  end
end
