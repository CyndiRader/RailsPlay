class Player < ActiveRecord::Base
	belongs_to :team

	default_scope { order(platoon: :desc, jersey: :asc) }

	validates :last_name, presence: true
	validates :jersey, presence: true
	validates :jersey, numericality: {only_integer: true}

	OPTIONS =  ['offense','defense','special teams']
	validate :platoon, inclusion: OPTIONS
end
