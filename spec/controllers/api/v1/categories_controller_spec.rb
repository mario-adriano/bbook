# typed: false
# frozen_string_literal: true

require "rails_helper"

describe Api::V1::CategoriesController, type: :controller do
  let(:valid_attributes) { { name: "High fantasy" } }
  let(:invalid_attributes) { { name: "" } }

  describe "Get #index" do
    it "returns a successful response" do
      Category.create!(valid_attributes)
      get :index
      expect(response).to(be_successful)
    end

    it "correctly calculates the number of categories" do
      get :index
      expect(JSON.parse(response.body).size).to(eq(0))
      Category.create!(valid_attributes)
      get :index
      expect(JSON.parse(response.body).size).to(eq(1))
    end
  end

  describe "GET #show" do
    it "returns a sucessful response" do
      category = Category.create!(valid_attributes)
      get :show, params: { id: category.id }
      expect(response).to(be_successful)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Category" do
        expect do
          post(:create, params: { category: valid_attributes })
        end.to(change(Category, :count).by(1))
      end

      it "returns a successful response" do
        post :create, params: { category: valid_attributes }
        expect(response).to(be_successful)
      end
    end

    context "with invalid parameters" do
      it "does not create a new category" do
        expect do
          post(:create, params: { category: invalid_attributes })
        end.not_to(change(Category, :count))
      end

      it "returns an unprocessable_entity response" do
        post :create, params: { category: invalid_attributes }
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) { { name: "non-fiction" } }

    before { @category = create(:category) }

    context "with valid parameters" do
      it "updates the requested category" do
        put :update, params: { id: @category.id, category: new_attributes }
        @category.reload
        expect(@category.name).to(eq("non-fiction"))
      end

      it "returns a successful response" do
        put :update, params: { id: @category.id, category: new_attributes }
        expect(response).to(be_successful)
      end
    end

    context "with invalid parameters" do
      it "returns an unprocessable_entity response" do
        put :update, params: { id: @category.id, category: invalid_attributes }
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      category = Category.create!(valid_attributes)
      expect do
        delete(:destroy, params: { id: category.id })
      end.to(change(Category, :count).by(-1))
    end
  end
end
