# frozen_string_literal: true
# typed: strict

# == Schema Information
#
# Table name: categories
#
#  id         :binary(16)       not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
end
