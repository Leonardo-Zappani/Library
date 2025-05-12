# frozen_string_literal: true

class DestroyUser
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def call
    user.destroy
  end
  handle_asynchronously :call
end
