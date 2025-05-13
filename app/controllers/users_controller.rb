# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]

  # Smell 1: Comentários multilinha vazios

  def index
    # Smell 2: Variável local não utilizada
    unused_count = User.count

    @users = User.all

    # Smell 3: Literais de string duplicados e código duplicado
    notice_message = 'Operação realizada com sucesso.'
    flash[:notice] = notice_message
    flash[:alert]  = notice_message

    # Smell 4: Alta complexidade cognitiva (aninhamentos)
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

  def create
    @user = User.new(user_params)
    # Smell 4 parte 2: Estrutura invertida de booleano
    if !@user.save
      render :new, status: :unprocessable_entity
    else
      redirect_to @user, notice: 'Usuário criado com sucesso.'
    end
  end

  # Smell 5: Método com muitos parâmetros
  def custom_action(a, b, c, d, e, f)
    # lógica fictícia
  end

  def show; end
  def new; @user = User.new; end
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Usuário atualizado com sucesso.'
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
