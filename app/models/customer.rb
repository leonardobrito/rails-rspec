# frozen_string_literal: true

# Customer
class Customer < ApplicationRecord
  def full_name
    "Sr. #{name}"
  end
end
