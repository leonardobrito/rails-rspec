# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  # fixtures :all
  # fixtures :customers

  it '#full_name' do
    # subject.name = 'Leonardo'
    # subject.email = 'f.leobrito@gmail.com'
    # customer = customers(:leonardo)
    # other_customer = customers(:john)

    # customer = build(:customer)
    customer = create(:customer)

    expect(customer.full_name).to start_with('Sr. ')
    expect(customer.full_name).to eq("Sr. #{customer.name}")
    # expect(other_customer.full_name).to eq('Sr. John Doe')
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
