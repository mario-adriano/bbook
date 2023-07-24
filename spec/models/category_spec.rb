# typed: false
# == Schema Information
#
# Table name: categories
#
#  id         :binary           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
# frozen_string_literal: true

require "rails_helper"
require "factory_bot_rails"

describe Category, type: :model do
  describe "database columns" do
    it { is_expected.to(have_db_column(:id).of_type(:binary)) }
    it { is_expected.to(have_db_column(:name).of_type(:string)) }
    it { is_expected.to(have_db_column(:created_at).of_type(:datetime)) }
    it { is_expected.to(have_db_column(:updated_at).of_type(:datetime)) }
  end

  describe "when all attributes are valid" do
    subject { build(:category) }

    it { is_expected.to(be_valid) }
  end

  describe "attributes consistency after persistence" do
    subject(:category) { create(:category) }

    it { expect(category.name).to(eq(FactoryBot.attributes_for(:category)[:name])) }
  end

  describe "validations" do
    subject { build(:category) }

    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_uniqueness_of(:name)) }
    it { is_expected.to(validate_length_of(:name).is_at_most(30)) }
  end
end
