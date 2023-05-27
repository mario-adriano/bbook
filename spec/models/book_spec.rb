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

    it "has a created_at column of type datetime" do
      expect(Category.column_for_attribute(:created_at).type).to(eq(:datetime))
    end

    it "has a updated_at column of type datetime" do
      expect(Category.column_for_attribute(:updated_at).type).to(eq(:datetime))
    end
  end

  describe "validations" do
    # before do
    #   @book = build(:book)
    # end

    subject { book }

    let(:book) { build(:book) }

    context "when title is invalid" do
      before { book.title = title }

      context "when title is empty" do
        let(:title) { "" }

        it { is_expected.to(be_invalid) }
        it { is_expected.to(validate_presence_of(:title)) }
      end

      context "when title is too long" do
        let(:title) { "a" * 71 }

        it { is_expected.to(be_invalid) }
        it { is_expected.to(validate_length_of(:title).is_at_most(70)) }
      end
    end

    context "when description is invalid" do
      before { book.description = description }

      context "when description is empty" do
        let(:description) { "" }

        it { is_expected.to(be_invalid) }
        it { is_expected.to(validate_presence_of(:description)) }
      end

      context "when description is too long" do
        let(:description) { "a" * 501 }

        it { is_expected.to(be_invalid) }
        it { is_expected.to(validate_length_of(:description).is_at_most(500)) }
      end
    end

    context "when original_publication_year is invalid" do
      before { book.original_publication_year = original_publication_year }

      context "when original_publication_year is empty" do
        let(:original_publication_year) { "" }

        it { is_expected.to(be_invalid) }
        it {
          is_expected.to(validate_numericality_of(:original_publication_year)
          .is_less_than_or_equal_to(Time.current.year))
        }
      end
    end

    context "when all attributes are valid" do
      it { is_expected.to(be_valid) }
    end
  end
end
