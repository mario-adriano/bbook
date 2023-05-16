# frozen_string_literal: true
# typed: strict

# == Schema Information
#
# Table name: categories
#
#  id         :binary           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  validates :name, presence: true
end
