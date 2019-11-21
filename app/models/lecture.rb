class Lecture < ApplicationRecord
    self.primary_keys = :giorno, :oraInizio, :aula
end