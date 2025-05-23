# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:logout]
  def redirect_to_login
    redirect_to '/login'
  end

  def logout
    sign_out(current_user)
    redirect_to root_path
  end

  def page
    @page_key = request.path[1..]
    render "pages/#{@page_key}"
  end
end
