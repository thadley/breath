class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  validates :email, :presence => {:message => " can't be blank. Please deselect 'Send email' if you do not wish to receive email notifications." }, :if => :send_email?
  
  validates :phone_number, :presence => {:message => " can't be blank if you wish to receive notifications via sms. Please deselect 'Send sms' if you do not wish to receive sms notifications." }, :if => :send_sms?
  
  validates :carrier, :presence => {:message => " can't be blank if you wish to receive notifications via sms."}, :if => :phone_number?

  validates :phone_number, 
            length: {is: 10, message: " must be 10 digits."}, 
            numericality: { only_integer: true, message: " may only consist of numbers." },
            uniqueness: { message: " is already associated with an account."}, :if => :phone_number?


     
  def get_carrier_email_by_name(name)
    carriers = {
      'AT&T' => '@txt.att.net',
      'Verizon' => '@vtext.com',
      'Sprint' => '@messaging.sprintpcs.com',
      'T-Mobile' => '@tmomail.net',
      'USCellular' => '@email.uscc.net'
      }

      carriers[name].to_s
  end


  def sms_address
    phone_number.to_s + get_carrier_email_by_name("#{carrier}")
  end


  before_create :generate_sms_verification_code, :if => :phone_number?
  before_update :generate_sms_verification_code, :if => :phone_number_changed?

  def generate_sms_verification_code
    code = rand(36**4).to_s(36)
    self.sms_verification_code = code
  end

  
  after_update :sms_verification

  def sms_verification
    if sms_verification_code == sms_verification_code_conf
      self.update_column(:sms_verified, true)
    else
      self.update_column(:sms_verified, false)
    end
  end


  after_save :send_sms_verification

  def send_sms_verification
    if phone_number.present? && phone_number_changed?
      SmsVerificationMailer.sms_verification_email(self).deliver
    end
  end  


  after_create :send_admin_email

  def send_admin_email
    NewUserMailer.new_user_email.deliver
  end

end
