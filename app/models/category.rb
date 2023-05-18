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

  before_save :downcase_name

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  private

  sig { void }
  def downcase_name
    name.downcase!
  end
end
