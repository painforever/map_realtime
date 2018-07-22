class HomeController < ApplicationController
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

  private
  def rabbit_transaction(code)
    Hutch.publish("new_rabbit_transaction", { country_code: code.downcase })
  end
end
