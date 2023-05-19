# typed: false
# frozen_string_literal: true

require "rails_helper"
require "factory_bot_rails"

describe Category, type: :model do
  describe "database columns" do
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
    it "requires a name" do
      category = Category.new(name: "")
      expect(category.valid?).to(be_falsey)
      expect(category.errors.details[:name]).to(include({ error: :blank }))
    end

    it "is valid with valid attributes" do
      category = Category.new(name: "Fiction")
      expect(category.valid?).to(be_truthy)
    end

    it "validates uniqueness of name" do
      Category.create!(name: "high fantasy")
      category = Category.new(name: "high fantasy")
      expect(category.valid?).to(eq(false))
      expect(category.errors.details[:name]).to(include({ error: :taken, value: "high fantasy" }))
    end

    it "validate name in lower case" do
      category = Category.create!(name: "HIGH FANTASY")
      expect(category.reload.name).to(eq("high fantasy"))
    end
  end
end
