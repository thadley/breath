class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :phone_number, length: {is: 10}, numericality: { only_integer: true }, allow_nil: true, uniqueness: true

  def get_carrier_email_by_name(name)
    carriers = {
      'AT&T' => '@txt.att.net',
      'Verizon' => '@vtext.com',
      'Sprint' => '@messaging.sprintpcs.com',
      'T-Mobile' => '@tmomail.net',
      'US Cellular' => '@email.uscc.net'
      }

      carriers[name].to_s
  end

  def sms_address
    phone_number.to_s + get_carrier_email_by_name("#{carrier}")
  end

  # phone number can only be added with update as user is created with Devise
  before_update :generate_sms_verification_code

  def generate_sms_verification_code
    self.sms_verification_code = rand(36**4).to_s(36)
  end

  def sms_verification
    if user.sms_verification_code = user.sms_verification_code_conf
      user.update_attribute(sms_verified => true)
    end
  end

end
