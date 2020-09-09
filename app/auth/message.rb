class Message
  def self.not_found(item)
    "Sorry, #{item} not found."
  end

  def self.invalid_credentials
    'Invalid credentials!'
  end

  def self.invalid_token
    'Invalid token!'
  end

  def self.missing_token
    'Missing token!'
  end

  def self.unauthorized
    'Unauthorized request!'
  end

  def self.sucessful_registration
    'Registration successful!'
  end

  def self.unsuccessful_registration
    'Account could be created, try again.'
  end

  def self.expired_token
    'Session expired. Please login again to continue.'
  end
end
