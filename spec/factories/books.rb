# typed: false
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

FactoryBot.define do
  factory :book do
    title { "The Lord of the Rings: The Fellowship of the Ring" }
    description do
      "The Lord of the Rings: The Fellowship of the Ring is the first installment in J.R.R. Tolkien's renowned fantasy
      trilogy, 'The Lord of the Rings'. The epic tale begins with the humble hobbit, Frodo Baggins, inheriting a ring of
      immense power from his uncle, Bilbo. When the wizard Gandalf discovers this ring is the One Ring of the Dark Lord
      Sauron, Frodo is charged with an immense task: to destroy the ring in the fires of Mount Doom. Joined by a
      fellowship of diverse companions, Frodo embarks on a perilous journey across Middle-Earth, pursued by Sauron's
      forces and the ring's own corrupting influence"
    end
    original_pushication_year { 1954 }
  end
end
