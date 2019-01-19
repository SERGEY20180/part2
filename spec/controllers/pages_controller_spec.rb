require 'rails_helper'

describe PagesController do 
  describe "guest user" do
    describe "GET index" do
      it "renders : index template" do 
        get :index
        expect(response).to render_template(:index)
      end
    end
    describe "GET show" do
      it "renders : index template" do 
        page = create(:page)
        get :show, id: page
        expect(response).to render_template(:show)
      end
    end
    describe "GET new" do
      it "redirect to login page" do
        get :new
        expect(response).to redirect_to(new_user_session_url)
      end 
    end
  end
  describe "authenticated user" do  
    let(:user) {FactoryGirl.create(:user)}
    before do
      sign_in(user)
    end
  
    describe 'GET #new' do
      it "assigns the requested page to @page" do
        page = create(:page)
        get :new
        expect(response).to render_template (:new)
      end  
      it "assigns new Page to @page" do
        get :new
        expect(assigns(:page)).to be_a_new(Page)
      end 
    end
    describe 'POST #create' do 
      it "saves the new page in the database" do
        expect{
          post :create, page: attributes_for(:page)
        }.to change(Page, :count).by(1)
      end
      it "redirects to pages#show" do
        post :create, page: attributes_for(:page)
        expect(response).to redirect_to page_path(assigns[:page])
      end
    end
    describe 'PATCH #update' do
      before :each do
        @page = create(:page,
          title: 'Title1',
          string: 'String')
      end

      context "valid attributes" do
        it "locates the requested @page" do
          patch :update, id: @page, page: attributes_for(:page)
          expect(assigns(:page)).to eq(@page)
        end
  
        it "changes @page's attributes" do
          patch :update, id: @page,
            page: attributes_for(:page,
              title: 'Title',
              string: 'String')
          @page.reload
          expect(@page.title).to eq('Title')
          expect(@page.string).to eq('String')
        end

        it "redirects to the updated page" do
          patch :update, id: @page, page: attributes_for(:page)
          expect(response).to redirect_to @page
        end
      end
  
      context "with invalid attributes" do
        it "does not change the page's attributes" do
          patch :update, id: @page,
            page: attributes_for(:page,
              title: 'Title',
              string: nil)
          @page.reload
          expect(@page.title).not_to eq('Title')
          expect(@page.string).to eq('String')
        end

        it "re-renders the edit template" do
          patch :update, id: @page,
            page: attributes_for(:invalid_page)
          expect(response).to render_template :edit
        end
      end
    end
    describe 'DELETE #destroy' do
      before :each do
        @page = create(:page)
      end

      it "deletes the page" do
        expect{
          delete :destroy, id: @page
        }.to change(Page,:count).by(-1)
      end
      it "redirects to contacts#index" do
        delete :destroy, id: @page
        expect(response).to redirect_to pages_url
      end
    end
  end
end
	
