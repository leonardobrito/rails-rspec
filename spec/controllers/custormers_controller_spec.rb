# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  context '#index' do
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

  context '#show' do
    it 'responds a 302 status when not authenticated' do
      costumer = create(:customer)
      get :show, params: { id: costumer.id }
      expect(response).to have_http_status(302)
    end

    it 'responds a 200 status when authenticated' do
      # Auth
      member = create(:member)
      sign_in member

      costumer = create(:customer)
      get :show, params: { id: costumer.id }
      expect(response).to have_http_status(200)
    end

    it 'render template when authenticated' do
      # Auth
      member = create(:member)
      sign_in member

      costumer = create(:customer)
      get :show, params: { id: costumer.id }
      expect(response).to render_template(:show)
    end
  end
end
