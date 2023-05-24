# typed: strict
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

class Book < ApplicationRecord
  extend T::Sig

  before_create :downcase_title

  validates :title, presence: true, length: { maximum: 70 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :original_publication_year, numericality: { less_than_or_equal_to: Time.current.year }

  private

  sig { void }
  def downcase_title
    title.downcase!
  end
end
