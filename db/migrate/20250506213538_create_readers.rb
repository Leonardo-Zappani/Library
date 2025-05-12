# frozen_string_literal: true

class CreateReaders < ActiveRecord::Migration[7.1]
  def change
    create_table :readers do |t|
      t.string :name
      t.string :email
      t.string :code

      t.timestamps
    end
  end
end
