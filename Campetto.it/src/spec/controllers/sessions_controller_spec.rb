require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { User.create(email: 'test@example.com', password: 'password123', confirmed_at: Time.current) }

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'logs the user in and redirects to the account page' do
        post :create, params: { session: { email_login: user.email, password_login: 'password123' } }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(accountUtente_path)
      end
    end

    context 'with unconfirmed account' do
      before { user.update(confirmed_at: nil) }

      it 'does not log the user in and redirects to login with an alert' do
        post :create, params: { session: { email_login: user.email, password_login: 'password123' } }
        expect(session[:user_id]).to be_nil
        expect(flash[:alert]).to eq("Devi confermare il tuo account prima di accedere.")
        expect(response).to redirect_to(logReg_path(form: 'login'))
      end
    end

    context 'with invalid credentials' do
      it 'does not log the user in and redirects to login with an error' do
        post :create, params: { session: { email_login: user.email, password_login: 'wrongpassword' } }
        expect(session[:user_id]).to be_nil
        expect(flash[:alert]).to eq("Email o password errati.")
        expect(response).to redirect_to(logReg_path(form: 'login'))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when logged in' do
      before do
        post :create, params: { session: { email_login: user.email, password_login: 'password123' } }
      end

      it 'logs the user out and redirects to the root path' do
        delete :destroy
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when not logged in' do
      it 'redirects to the root path without modifying the session' do
        delete :destroy
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
