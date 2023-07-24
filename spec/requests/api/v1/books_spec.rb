# typed: false
# frozen_string_literal: true

require "rails_helper"

describe Api::V1::BooksController, type: :request do
  describe "GET #index" do
    let(:path) { "/api/v1/books" }

    before { get path }

    it "returns with 200" do
      expect(response.status).to(eq(200))
    end

    it "correctly calculates the number of books" do
      expect(JSON.parse(response.body).size).to(eq(0))
      create(:book)
      get path
      expect(JSON.parse(response.body).size).to(eq(1))
    end
  end

  describe "GET #show" do
    context "when the book exists in the database" do
      let(:book) { create(:book) }
      let(:path) { "/api/v1/books/#{book.id}" }

      it "returns with 200" do
        get path
        expect(response.status).to(eq(200))
      end
    end

    context "when the book does not exist in the database" do
      let(:path) { "/api/v1/books/123" }

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
    let(:book) { create(:book) }

    context "when the book exists in the database" do
      let(:new_attributes) do
        {
          title: "The Lord of the Rings: The Two Towers",
          description: "The surviving members of the Fellowship have split into three groups. Frodo and Sam face many
                        perils on their continuing quest to save Middle-earth by destroying the One Ring in the fires
                        of Mount Doom",
          original_publication_year: 1955,
        }
      end
      let(:path) { "/api/v1/books/#{book.id}" }

      before do
        put path, params: { book: new_attributes }
      end

      it "updates the title of the book" do
        title = JSON.parse(response.body)["title"]
        expect(title).to(eq(new_attributes[:title]))
      end

      it "updates the description of the book" do
        description = JSON.parse(response.body)["description"]
        expect(description).to(eq(new_attributes[:description]))
      end

      it "updates the original_publication_year of the book" do
        original_publication_year = JSON.parse(response.body)["original_publication_year"]
        expect(original_publication_year).to(eq(new_attributes[:original_publication_year]))
      end

      it "responds with 200" do
        expect(response.status).to(eq(200))
      end

      it "returns the book json" do
        expect(JSON.parse(response.body)["title"]).to(eq(new_attributes[:title]))
      end
    end

    context "when the book does not exist in the database" do
      let(:new_attributes) { { title: "The Lord of the Rings: The Two Towers" } }
      let(:path) { "/api/v1/books/123" }

      before do
        put path, params: { book: new_attributes }
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
