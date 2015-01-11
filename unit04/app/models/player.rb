class Player < ActiveRecord::Base
	validates :last_name, presence: true
	validates :jersey, presence: true
end
