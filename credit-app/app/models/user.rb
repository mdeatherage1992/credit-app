class User < ApplicationRecord
  has_many :activities
  has_one :account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable,:validatable, :confirmable, :lockable,:zxcvbnable

       def send_devise_notification(notification, *args)
        devise_mailer.send(notification, self, *args).deliver_later
      end
end
