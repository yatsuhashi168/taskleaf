# frozen_string_literal: true

class SampleJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Sidekiq::Logging.logger.info 'サンプルジョブを実行しました'
  end
end
