require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    before do
      get :new
    end

    it "is success" do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe "POST #create" do
    context "valid user" do
      let(:user) { build(:user) }

      before do
        post :create, user: {
          name: user.name,
          email: user.email,
          password: user.password,
          password_confirmation: user.password_confirmation
        }
      end

      it "redirects to Welcome page" do
        expect(response).to redirect_to root_path
        expect(flash["success"]).to eq SIGN_UP_SUCCESSFULLY_MESSAGE
      end
    end

    context "invalid user" do
      let(:user) { build(:user, email: "a.bc") }

      before do
        post :create, user: {
          name: user.name,
          email: user.email,
          password: user.password,
          password_confirmation: user.password_confirmation
        }
      end

      it "shows error" do
        expect(response).to render_template :new
        expect(flash["error"]).to eq SIGN_UP_WITH_INVALID_EMAIL_ERROR
      end
    end
  end
end
