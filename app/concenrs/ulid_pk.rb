# rubocop:disable Style/Documentation
# frozen_string_literal: true
# typed: true

require 'ulid'

module UlidPk
  extend ActiveSupport::Concern
  extend T::Sig

  sig { returns(String) }
  attr_accessor :id

  included do
    class_eval do
      before_create :set_ulid
    end
  end

  sig { void }
  def set_ulid
    self.id = ULID.generate
  end
end

# rubocop:enable Style/Documentation
