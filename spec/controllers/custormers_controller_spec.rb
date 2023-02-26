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
    before do
      @costumer = create(:customer)
    end

    it 'responds a 302 status when not authenticated' do
      get :show, params: { id: @costumer.id }
      expect(response).to have_http_status(302)
    end

    describe 'when authenticated' do
      before do
        # Auth
        member = create(:member)
        sign_in member
      end

      it 'responds a 200 status' do
        get :show, params: { id: @costumer.id }
        expect(response).to have_http_status(200)
      end

      it 'render template' do
        get :show, params: { id: @costumer.id }
        expect(response).to render_template(:show)
      end
    end
  end

  context '#create' do
    before do
      member = create(:member)
      sign_in member

      @customer_attrs = attributes_for(:customer)
    end

    it 'responds a 201 status' do
      expect do
        post :create, params: { customer: @customer_attrs }
      end.to change(Customer, :count).by(1)
    end
  end
end
