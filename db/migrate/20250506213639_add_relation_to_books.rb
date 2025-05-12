# frozen_string_literal: true

class AddRelationToBooks < ActiveRecord::Migration[7.1]
  def change
    add_reference :books, :reader, null: true, foreign_key: true
  end
end
