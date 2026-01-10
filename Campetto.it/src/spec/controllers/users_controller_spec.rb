require 'rails_helper'
require 'pry'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    context 'when valid parameters are provided' do
      let(:valid_attributes) do
        {
          user: {
            email: 'test@example.com',
            password: 'password123',
            password_confirmation:'password123'
          }
        }
      end

      it 'creates a new user' do
        expect {
          post :create, params: valid_attributes
        }.to change(User, :count).by(1)
      end

      it 'sends a confirmation email' do
        expect {
          post :create, params: valid_attributes
        }.to change { UserMailer.deliveries.count }.by(1)
      end

      it 'redirects to the login page with a success message' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(logReg_path(form: 'login'))
        expect(flash[:notice]).to eq("Registrazione avvenuta con successo, ora conferma via email")
      end
    end

    context 'when invalid parameters are provided' do
      let(:invalid_attributes) do
        {
          user: {
            email: 'invalid_email',
            password: 'short',
            password_confirmation: 'short'
          }
        }
      end

      it 'does not create a new user' do
        expect {
          post :create, params: invalid_attributes
        }.not_to change(User, :count)
      end

      it 'redirects to the signup page with an error message' do
        post :create, params: invalid_attributes
        expect(response).to redirect_to(logReg_path(form: 'signup'))
        expect(flash[:alert]).to eq("Email già registrata, usane un'altra.")
      end
    end
  end

  describe 'GET #confirm' do
    let!(:user) { User.create(email: 'test@example.com', password: 'password123', password_confirmation:'password123', confirmation_token: 'valid_token', confirmation_sent_at: Time.now) }

    context 'when the token is valid and not expired' do
      before do
        get :confirm, params: { token: 'valid_token' }
      end

      it 'confirms the user account' do
        expect(user.reload.confirmed?).to be_truthy
        expect(user.confirmed_at).not_to be_nil
      end

      it 'redirects to the login page with a success message' do
        expect(flash[:notice]).to eq('Il tuo account è stato confermato. Ora puoi effettuare il login.')
        expect(response).to redirect_to(logReg_path(form: 'login'))
      end
    end

    context 'when the token is invalid or expired' do
      let!(:user) do
        User.create(
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          confirmation_token: 'valid_token', # Puoi usare un token valido
          confirmation_sent_at: 2.hours.ago # Simula un token scaduto
        )
      end
    
      it 'redirects to the signup page with an error message' do
        get :confirm, params: { token: 'invalid_token' }
        expect(flash[:alert]).to eq('Token di conferma non valido o scaduto. Registrati nuovamente.')
        expect(response).to redirect_to(logReg_path(form: 'signup'))
      end
    end    
  end

  describe "GET #accountUtente" do
    context "when user is not logged in" do
      it "redirects to logReg_path with an alert message" do
        get :accountUtente

        # Verifica che ci sia un redirect verso logReg_path
        expect(response).to redirect_to(logReg_path)

        # Verifica che il messaggio di alert sia presente
        expect(flash[:alert]).to eq("Devi accedere per visualizzare questa pagina.")
      end
    end

    context "when user is logged in" do
      it "allows access to the account page" do
        user = User.create!(email: "test@example.com", password: "Password1!",password_confirmation:"Password1!", confirmed_at: Time.now)

        session[:user_id] = user.id

        get :accountUtente
        
        expect(response).to have_http_status(:success)

        expect(response).to render_template(:accountUtente)
      end
    end
  end
end
