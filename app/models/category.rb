# typed: strict
# frozen_string_literal: true

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
class Category < ApplicationRecord
  extend T::Sig

  validates :name, presence: true, length: { maximum: 30 }
  validates :name, uniqueness: { case_sensitive: false }

  sig { params(value: String).void }
  def name=(value)
    write_attribute(:name, value.downcase.strip)
  end
end
