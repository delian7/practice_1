# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @users' do
      user = User.create!(name: 'John', email: 'john@example.com')
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: { name: 'John', email: 'john@example.com' } }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the created user' do
        post :create, params: { user: { name: 'John', email: 'john@example.com' } }
        expect(response).to redirect_to(User.last)
      end
    end
  end
end
