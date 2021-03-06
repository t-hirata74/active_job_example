class AsyncLogJob < ApplicationJob
  # queue_as :async_log # defaultキーから変更、config/sidekiq.ymlで設定追加する必要有り

  queue_as do
    case self.arguments.first[:message]
    when "to async_log"
      :async_log
    else
      :default
    end
  end

  def perform(message: "hello")
    AsyncLog.create!(message: message)
  end
end
