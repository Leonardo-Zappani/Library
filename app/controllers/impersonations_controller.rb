# frozen_string_literal: true

class ImpersonationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def new
    sign_in(@user)
    redirect_to available_books_path, notice: "[ADMIN] You are now signed in as #{@user.email}"
  end

  private

  def set_user
    @user = User.find_by_id(params[:user_id])
  end
end
