class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  

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

end
