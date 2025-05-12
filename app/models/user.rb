# frozen_string_literal: true

class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable

  scope :subscribed, -> { where.not(stripe_subscription_id: [nil, '']) }
  scope :reviewers, -> { where('permissions @> ARRAY[?]::varchar[]', ['review']) }

  has_many :books

  def role
    admin? ? 'Admin' : 'User'
  end
end
