# rubocop:disable Style/Documentation
# frozen_string_literal: true
# typed: strict

class ApplicationRecord < ActiveRecord::Base
  include UlidPk
  primary_abstract_class
end
# rubocop:enable Style/Documentation
