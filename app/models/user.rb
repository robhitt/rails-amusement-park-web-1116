class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    unless self.admin
      if self.nausea > self.happiness
        return 'sad'
      else
        return 'happy'
      end
    end
  end


  # def password=(password)
  #   @password = password # "Fido"
  #   salted_and_hashed = bcrpyt(password) # $2aAfdkjlsdafkjlds.asdfjkl
  #   password_digest= salted_and_hashed
  # end
  #
  # def password
  #   @password
  # end


end
