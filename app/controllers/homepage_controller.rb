class HomepageController < ApplicationController

	include GraphHelper
	include HomepageHelper

	def getLesson

		@dayValue = params['day']

		@lessons = getDayCourses

		render "index"
	end

	def quickNotes

		@dayV = params['day']
		@hourV = params['hour']

		ret = getHourLesson

		@@notebook = get_notebook_id
		if ret[0] != nil
			create_onenote_section current_user.token || [], ret[0], @@notebook

			section = search_onenote_section current_user.token || [], @@notebook, ret[0]

			create_onenote_page(current_user.token || [], params['date'], section[0]['id'], @@notebook)

			page = search_onenote_page current_user.token || [], @@notebook, section[0]['displayName'], params['date'], nil

			redirect_to page[0]['links']['oneNoteWebUrl']['href']
		else
			redirect_to homepage_index_path
			flash[:error] = 'Non sono registrate lezioni al momento!'
		end
	end

	def index
		if !(@lessons.present?)
			@lessons = Array.new;
		end
	end




end
