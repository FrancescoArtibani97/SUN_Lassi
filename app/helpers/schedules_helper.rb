require 'matrix'
module SchedulesHelper
	def getSchedule
		userCourses = Enroll.where(matricola: current_user.matricola).collect { |e| e.materia}	

		ret = Lecture.where(course: userCourses)
		
		m = Matrix.build(11,5) { " " };
		
		dayIdx = 0
		hourIdx = 0
			
		ret.each do |r|
			day = r.giorno.strip
			
			if(day == "Lunedì")
				dayIdx = 0
			elsif (day == "Martedì")
				dayIdx = 1
			elsif (day == "Mercoledì")
				dayIdx = 2
			elsif (day == "Giovedì")
				dayIdx = 3
			else
				dayIdx = 4
			end
			
			
			case r.oraInizio.strip
				when "8:00"
					hourIdx = 0
				when "9:00"
					hourIdx = 1
				when "10:00"
					hourIdx = 2
				when "11:00"
					hourIdx = 3
				when "12:00"
					hourIdx = 4
				when "13:00"
					hourIdx = 5
				when "14:00"
					hourIdx = 6
				when "15:00"
					hourIdx = 7
				when "16:00"
					hourIdx = 8
				when "17:00"
					hourIdx = 9
				else
					hourIdx = 10
			end
			
			if m[hourIdx,dayIdx] != " "
				m[hourIdx,dayIdx] += " ,\n" + r.course
			else
				m[hourIdx,dayIdx] = r.course
			end
		end
		
		m
	end
end
