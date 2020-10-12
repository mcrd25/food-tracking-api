module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    # Unprocessable enetity errors
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    # 401
    rescue_from ExceptionHandler::AuthenticationError do |err|
      json_response({ message: err.message }, :unauthorized)
    end

    # 404
    rescue_from ActiveRecord::RecordNotFound do |err|
      json_response({ message: err.message }, :not_found)
    end
  end

  private

  # 422 - unprocessable entitiy
  def four_twenty_two(err)
    json_response({ message: err.message }, :unprocessable_entity)
  end
end
