class Enroll < ApplicationRecord
    belongs_to :user
    belongs_to :course
    
    self.primary_keys = :matricola, :materia
end
