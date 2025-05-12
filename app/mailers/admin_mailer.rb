# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  def error(subject, context = nil)
    @context = context
    mail(to: ENV['ADMIN_EMAIL'], subject:)
  end
end
