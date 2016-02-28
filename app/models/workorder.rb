class Workorder < ActiveRecord::Base
	belongs_to :status
	belongs_to :user
	belongs_to :procmode
end
