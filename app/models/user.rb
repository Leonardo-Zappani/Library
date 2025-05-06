class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable

  scope :subscribed, -> { where.not(stripe_subscription_id: [nil, '']) }
  scope :reviewers, -> { where('permissions @> ARRAY[?]::varchar[]', ['review']) }

  def role
    return 'Admin' if admin?

    'Autor'
  end
end
