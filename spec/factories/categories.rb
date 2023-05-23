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

FactoryBot.define do
  factory :category do
    name { "Adventure" }
  end
end
