# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to a Customer' do
    order = create(:order)

    expect(order.customer).to be_kind_of Customer
  end

  it 'should have a list or order with create_list' do
    orders = create_list(:order, 3)

    expect(orders.size).to eq(3)
  end
end
