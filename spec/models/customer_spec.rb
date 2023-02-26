# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  # fixtures :all
  fixtures :customers

  it 'creates a customer' do
    # subject.name = 'Leonardo'
    # subject.email = 'f.leobrito@gmail.com'
    customer = customers(:leonardo)
    other_customer = customers(:john)

    expect(customer.full_name).to eq('Sr. Leonardo Brito')
    expect(other_customer.full_name).to eq('Sr. John Doe')
  end
end
