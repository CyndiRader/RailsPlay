class Player < ActiveRecord::Base
	belongs_to :team
	validates :last_name, presence: true
	validates :jersey, presence: true
	validates :jersey, numericality: {only_integer: true}
	#VALID_STATES = %w(O D S)
	#validates :platoon, :inclusion => { :in => VALID_STATES }
	#validates :platoon, inclusion: {:in => %w(offense defense special),  message: "%{value} is not a valid size"}
	OPTIONS = %w(offense defense special)

	validate :platoon, inclusion: OPTIONS
end
