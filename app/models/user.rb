class User < ActiveRecord::Base
	has_one :setting
	has_many :workorders

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.name = auth['info']['name']
    end
  end
end
