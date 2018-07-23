class HomeController < ApplicationController
  include ActionController::Live

  def index

  end

  def new_transaction
    @code = Faker::Address.country_code
    rabbit_transaction @code
    respond_to do |format|
      format.json {render json: @code, status: :ok}
      format.js
    end
  end

  def live_status
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, event: 'time')
    sse.write({ time: Time.now })
    begin
      loop do
        sse.write({ time: Time.now })
        sleep 1
      end
    rescue ClientDisconnected
    ensure
      sse.close
    end
  end

  private
  def rabbit_transaction(code)
    Hutch.publish("new_rabbit_transaction", { country_code: code.downcase })
  end
end
