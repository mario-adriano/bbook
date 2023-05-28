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
    it { should have_db_column(:id).of_type(:binary) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:original_publication_year).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "when all attributes are valid" do
    subject { build(:book) }

    it { is_expected.to(be_valid) }
  end

  describe "attributes consistency after persistence" do
    subject(:book) { create(:book) }

    it { expect(book.title).to(eq(FactoryBot.attributes_for(:book)[:title])) }
    it { expect(book.description).to(eq(FactoryBot.attributes_for(:book)[:description])) }
    it { expect(book.original_publication_year).to(eq(FactoryBot.attributes_for(:book)[:original_publication_year])) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(70) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(500) }
    it {
      should validate_numericality_of(:original_publication_year).is_less_than_or_equal_to(Time.current.year)
    }
  end
end
