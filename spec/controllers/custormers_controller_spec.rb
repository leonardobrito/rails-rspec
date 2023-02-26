# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'responds to successfully' do
    get :index
    expect(response).to be_successful
  end

  it 'responds to :success' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'responds to :ok' do
    get :index
    expect(response).to have_http_status(:ok)
  end

  it 'responds a 200 status' do
    get :index
    expect(response).to have_http_status(200)
  end
end
