class Course < ApplicationRecord
    has_many :enrolls
    has_many :users, through: :enrolls

    self.primary_key = :materia
end
