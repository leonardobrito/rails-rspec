# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/customers', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Customer. As you add validations to Customer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    attributes_for(:customer)
  end

  let(:invalid_attributes) do
    attributes_for(:customer, address: nil)
  end

  let(:login) do
    member = create(:member)
    sign_in member
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Customer.create! valid_attributes
      get customers_path
      expect(response).to be_successful
    end

    it 'renders a successful response' do
      Customer.create! valid_attributes
      get(customers_path, params: { format: :json })
      expect(response).to be_successful
      expect(response.body).to include_json([
                                              id: 1,
                                              name: (be_kind_of String),
                                              email: (be_kind_of String)
                                            ])
    end
  end

  describe 'GET /show' do
    before do
      login
    end

    it 'renders a successful response' do
      customer = Customer.create! valid_attributes
      get customer_url(customer)
      expect(response).to be_successful
    end

    it 'renders a successful json response' do
      customer = Customer.create! valid_attributes
      get customer_url(customer, params: { format: :json })
      expect(response.body).to include_json(
        id: customer.id,
        name: (be_kind_of String),
        email: (be_kind_of String)
      )
    end

    it 'renders a successful json response with regex id' do
      customer = Customer.create! valid_attributes
      get customer_url(customer, params: { format: :json })
      expect(response.body).to include_json(
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)
      )
    end
  end

  describe 'GET /new' do
    before do
      login
    end

    it 'renders a successful response' do
      get new_customer_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    before do
      login
    end

    it 'renders a successful response' do
      customer = Customer.create! valid_attributes
      get edit_customer_url(customer)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    before do
      login
    end

    context 'with valid parameters' do
      it 'creates a new Customer' do
        expect do
          post customers_url, params: { customer: valid_attributes }
        end.to change(Customer, :count).by(1)
      end

      it 'creates a new Customer with json request' do
        expect do
          post customers_url, params: { customer: valid_attributes, format: :json }
        end.to change(Customer, :count).by(1)

        expect(response.body).to include_json(
          id: /\d/,
          name: valid_attributes[:name],
          email: valid_attributes[:email]
        )

        expect(response.body).to include_json(
          id: /\d/,
          name: valid_attributes.fetch(:name),
          email: valid_attributes.fetch(:email)
        )
      end

      it 'redirects to the created customer' do
        post customers_url, params: { customer: valid_attributes }
        expect(response).to redirect_to(customer_url(Customer.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Customer' do
        expect do
          post customers_url, params: { customer: invalid_attributes }
        end.to change(Customer, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post customers_url, params: { customer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    before do
      login
    end

    context 'with valid parameters' do
      let(:new_attributes) do
        attributes_for(:customer)
      end

      it 'updates the requested customer' do
        customer = Customer.create! valid_attributes
        patch customer_url(customer), params: { customer: new_attributes }
        customer.reload

        expect(customer.name).to eq(new_attributes.fetch(:name))
        expect(customer.email).to eq(new_attributes.fetch(:email))
      end

      it 'updates the requested customer json' do
        customer = Customer.create! valid_attributes
        patch customer_url(customer), params: { customer: new_attributes, format: :json }
        customer.reload

        expect(response.body).to include_json(
          id: /\d/,
          name: new_attributes.fetch(:name),
          email: new_attributes.fetch(:email)
        )
      end

      it 'redirects to the customer' do
        customer = Customer.create! valid_attributes
        patch customer_url(customer), params: { customer: new_attributes }
        customer.reload
        expect(response).to redirect_to(customer_url(customer))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer), params: { customer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    before do
      login
    end

    it 'destroys the requested customer' do
      customer = Customer.create! valid_attributes
      expect do
        delete customer_url(customer)
      end.to change(Customer, :count).by(-1)
    end

    it 'redirects to the customers list' do
      customer = Customer.create! valid_attributes
      delete customer_url(customer)
      expect(response).to redirect_to(customers_url)
    end
  end
end
