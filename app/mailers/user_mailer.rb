# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: user.email, subject: "welcome to #{ENV['COMPANY_NAME']}!")
  end

  def reminder_to_start_trial(user)
    @user = user
    mail(to: user.email, subject: 'reminder to start your free trial')
  end

  def offer_setup_assistance(user)
    @user = user
    mail(to: user.email, subject: 'can we help you get set up?')
  end
end
