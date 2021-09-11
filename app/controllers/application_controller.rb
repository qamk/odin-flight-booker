class ApplicationController < ActionController::Base

  protected

  def valid_passengers?(num)
    num.positive? && num <= 4
  end
end
