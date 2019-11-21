module HomepageHelper

	def getDayCourses

		ret = getUserCoursesData

		# array of current day lessons
		# default 11 (lesson hours in one day)
		dayLessons = Array.new

		# ret => dayLessons.uniq , dayLessons.compact!

		ret.each do |r|

			day = r.giorno.strip

			# skips loop if course day is different from the one is searching for
			next if !(day.downcase == @dayValue)

			dayLessons << r.course

		end

		dayLessons = dayLessons.compact

		dayLessons = dayLessons.uniq

		dayLessons

	end

	def getHourLesson

		lec = getUserCoursesData

		@dayValue = getDayName
		#@dayValue = "mercoledì"

		# matching the db oraInizio string
		@hourV += ":00"
		#@hourV = "9:00"
		#@hourV = "10:00"
		courses = Array.new

		lec.each do |l|

			day = l.giorno.strip
			hour = l.oraInizio.strip

			#break l.course if (day.downcase == @dayValue and hour == @hourV)

			# OLD METHOD

			# skips loop if course day is different from the one is searching for
			#next if !(day.downcase == @dayValue and hour == @hourV )

			#puts "HOUR LESSON"
			#puts day
			#puts hour


			# pushes lessons that takes place in @dayValue at @hourV
			next if !(day.downcase == @dayValue and hour == @hourV)

			courses.push(l.course)

		end

		courses

	end


	private

	def getUserCoursesData

		userCourses = Enroll.where(matricola: current_user.matricola).collect { |e| e.materia }

		r = Lecture.where(course: userCourses)

		r
	end

	def getDayName

		day = ""

		case @dayV
			when '1'
				day = "lunedì"
			when '2'
				day = "martedì"
			when '3'
				day = "mercoledì"
			when '4'
				day = "giovedì"
			when '5'
				day = "venerdì"
			else
				day = ""
		end

		day

	end

end
