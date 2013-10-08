class Property < ActiveRecord::Base

  before_create :generate_token
  belongs_to :user
  validate :user, :presence => true

  def to_param
   uuid
  end
  
  protected

  def generate_token
    self.uuid = loop do
      random_token = SecureRandom.urlsafe_base64(6, false).downcase!.gsub /[\W_]/, ''
      break random_token unless Property.where(uuid: random_token).exists?
    end
  end

end
