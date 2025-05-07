class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: :desc)
    @books = Book.all.order(created_at: :desc)
  end
end
