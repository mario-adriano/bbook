# typed: false
# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id                        :binary           not null, primary key
#  description               :text             not null
#  original_publication_year :integer          not null
#  title                     :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
require "rails_helper"

RSpec.describe(Book, type: :model) do
  describe "database column" do
    it "has a id column of type binary" do
      expect(Book.column_for_attribute(:id).type).to(eq(:binary))
    end

    it "has a description column of type text" do
      expect(Book.column_for_attribute(:description).type).to(eq(:text))
    end

    it "has a title column of type string" do
      expect(Book.column_for_attribute(:title).type).to(eq(:string))
    end

    it "has a original_publication_year column of type integer" do
      expect(Book.column_for_attribute(:original_publication_year).type).to(eq(:integer))
    end
  end

  describe "validations" do
    before do
      @book = Book.new(
        title: "The Hobbit",
        description: "The Hobbit is set in Middle-earth and follows home-loving
                      Bilbo Baggins, the titular hobbit",
        original_publication_year: 1937,
      )
    end

    context "when validating title" do
      it "is invalid without a title" do
        @book.title = ""
        expect(@book.valid?).to(be_falsey)
        expect(@book.errors.details[:title]).to(include({ error: :blank }))
      end

      it "is invalid with a title longer than 70 characters" do
        @book.title = "a" * 71
        expect(@book.valid?).to(be_falsey)
        expect(@book.errors.details[:title]).to(include({ count: 70, error: :too_long }))
      end
    end

    context "when validating description" do
      it "is invalid without a description" do
        @book.description = ""
        expect(@book.valid?).to(be_falsey)
        expect(@book.errors.details[:description]).to(include({ error: :blank }))
      end

      it "is invalid with a description longer than 500 characters" do
        @book.description = "a" * 501
        expect(@book.valid?).to(be_falsey)
        expect(@book.errors.details[:description]).to(include({ count: 500, error: :too_long }))
      end
    end

    context "when validating original_publication_year" do
      it "is invalid without a publication year" do
        @book.original_publication_year = nil
        expect(@book.valid?).to(be_falsey)
        expect(@book.errors.details[:original_publication_year]).to(include({ error: :not_a_number, value: nil }))
      end

      it "is invalid with a non-numeric publication year" do
        @book.original_publication_year = "abc"
        expect(@book.valid?).to(be_falsey)
        expect(@book.errors.details[:original_publication_year]).to(include({ error: :not_a_number, value: "abc" }))
      end

      it "is invalid with a publication year in the future" do
        @book.original_publication_year = Time.current.year + 1
        expect(@book.valid?).to(be_falsey)
        expect(@book.errors.details[:original_publication_year]).to(include({
          count: 2023,
          error: :less_than_or_equal_to,
          value: 2024,
        }))
      end
    end

    context "when all attributes are valid" do
      it "is valid with valid attributes" do
        expect(@book.valid?).to(be_truthy)
      end
    end
  end

  describe "before_create" do
    before do
      @book = Book.new(
        title: "The Hobbit",
        description: "The Hobbit is set in Middle-earth and follows home-loving
                      Bilbo Baggins, the titular hobbit",
        original_publication_year: 1937,
      )
    end

    context "when processing title" do
      it "converts title to lowercase before saving" do
        @book.title = "THE HOBBIT"
        @book.save!
        expect(@book.reload.title).to(eq("the hobbit"))
      end
    end
  end
end
