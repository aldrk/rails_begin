module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :login, presence: true, uniqueness: true
    validates :password_digest, presence: true, if: Proc.new { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      # set model attribute
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(str)
    Digest::SHA1.hexdigest(str)
  end
end