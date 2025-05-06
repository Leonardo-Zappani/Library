# frozen_string_literal: true

class Book < ApplicationRecord
  #      t.string :title
  #       t.string :author
  #       t.string :description
  #
  #       t.boolean :available, default: true
  #
  #       t.references :user, foreign_key: true, index: true, null: true
  #
  #       t.timestamps
  belongs_to :user, optional: true
end
