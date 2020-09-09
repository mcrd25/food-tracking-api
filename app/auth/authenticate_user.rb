class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: current_user.id) if current_user
  end

  private

  attr_reader :email, :password

  def current_user
    user = User.find_by(email: email)
    return user if user&.authenticate(password)

    raise(
      ExceptionHandler::AuthenticationError,
      Message.invalid_credentials
    )
  end
end
