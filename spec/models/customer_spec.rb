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

  it '#full_name with Sr. Leonardo' do
    # override attributes and aliases [:user]
    customer = create(:user, name: 'Leonardo')

    expect(customer.full_name).to eq('Sr. Leonardo')
  end

  it '#vip' do
    # override attributes
    # customer = create(:customer, vip: false, days_to_pay: 15)
    customer = create(:customer_vip)
    customer_default = create(:customer_default)

    expect(customer.vip).to be_truthy
    expect(customer_default.vip).to be_falsey
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
