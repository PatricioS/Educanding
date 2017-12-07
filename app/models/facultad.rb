class Facultad < ApplicationRecord
	has_many :users
	has_many :questions , dependent: :destroy
end
