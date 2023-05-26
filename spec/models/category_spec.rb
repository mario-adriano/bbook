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
    it "has a id column of type binary" do
      expect(Category.column_for_attribute(:id).type).to(eq(:binary))
    end

    it "has a name column of type string" do
      expect(Category.column_for_attribute(:name).type).to(eq(:string))
    end

    it "has a created_at column of type datetime" do
      expect(Category.column_for_attribute(:created_at).type).to(eq(:datetime))
    end

    it "has a updated_at column of type datetime" do
      expect(Category.column_for_attribute(:updated_at).type).to(eq(:datetime))
    end
  end

  describe "validations" do
    before do
      @category = build(:category)
    end

    context "when validating name" do
      it "is invalid without a name" do
        @category.name = ""
        expect(@category).to(be_invalid)
        expect(@category.errors.details[:name]).to(include({ error: :blank }))
      end

      it "is invalid with same name" do
        @category.save!
        new_category = build(:category, name: "adventure")
        expect(new_category).to(be_invalid)
        expect(new_category.errors.details[:name]).to(include({ error: :taken, value: "adventure" }))
      end

      it "is invalid with a description longer than 30 characters" do
        @category.name = "a" * 31
        expect(@category).to(be_invalid)
        expect(@category.errors.details[:name]).to(include({ count: 30, error: :too_long }))
      end
    end

    context "when all attributes are valid" do
      it "is valid with valid attributes" do
        expect(@category).to(be_valid)
      end
    end
  end
end
