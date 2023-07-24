# typed: false
# frozen_string_literal: true

require "rails_helper"

describe Api::V1::CategoriesController, type: :request do
  describe "GET #index" do
    let(:path) { "/api/v1/categories" }

    before { get path }

    it "returns with 200" do
      expect(response.status).to(eq(200))
    end

    it "correctly calculates the number of categories" do
      expect(JSON.parse(response.body).size).to(eq(0))
      create(:category)
      get path
      expect(JSON.parse(response.body).size).to(eq(1))
    end
  end

  describe "GET #show" do
    context "when the category exists in the database" do
      let(:category) { create(:category) }
      let(:path) { "/api/v1/categories/#{category.id}" }

      it "returns with 200" do
        get path
        expect(response.status).to(eq(200))
      end
    end

    context "when the category does not exist in the database" do
      let(:path) { "/api/v1/categories/123" }

      before { get path }

      it "returns with 404" do
        expect(response.status).to(eq(404))
      end
      it "returns a json with 'record not found'" do
        expect(response.body).to(eq({ error: "Record not found" }.to_json))
      end
    end
  end

  describe "PUT #update" do
    let(:category) { create(:category) }
    let(:new_attributes) { { name: "Fiction" } }

    context "when the category exists in the database" do
      let(:path) { "/api/v1/categories/#{category.id}" }

      before do
        put path, params: { category: new_attributes }
      end

      it "updates the name of the category" do
        category = JSON.parse(response.body)["category"]
        expect(category).to(eq(new_attributes[:category]))
      end

      it "responds with 200" do
        expect(response.status).to(eq(200))
      end

      it "returns the category json" do
        expect(JSON.parse(response.body)["name"]).to(eq(new_attributes[:name]))
      end
    end

    context "when the category does not exist in the database" do
      let(:path) { "/api/v1/categories/123" }

      before do
        put path, params: { category: new_attributes }
      end

      it "returns with 404" do
        expect(response.status).to(eq(404))
      end
      it "returns a json with 'record not found'" do
        expect(response.body).to(eq({ error: "Record not found" }.to_json))
      end
    end
  end
end
