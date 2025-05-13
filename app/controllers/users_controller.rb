# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all

    # Adicionando um logger para verificar os usuários, de maneira errada
    # pois independente da condição, o log será o mesmo, ou seja, é uma computação desnecessaria
    if @users.any?
      @users.each do |user|
        if user.active?
          logger.info user.email
        else
          logger.info user.email
        end
      end
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    # Adicionando variavel nao utilizada.
    user = User.new(user_params)
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), notice: 'Usuário criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Usuário atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Usuário excluído com sucesso.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # permit name, email, password (and confirmation)
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
