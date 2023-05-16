# typed: false
# frozen_string_literal: true

require "ulid"

module UlidPk
  extend ActiveSupport::Concern
  extend T::Sig

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
