# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'taskleaf@example.com'
  layout 'mailer'
end
