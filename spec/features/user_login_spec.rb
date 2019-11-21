require 'rails_helper'

RSpec.feature "UserLoginAndLogouts", type: :feature do
  feature "User logs in" do

  # `js: true` spec metadata means this will run using the `:selenium`
  # browser driver configured in spec/support/capybara.rb
	  scenario "with correct details", js: true do
	  	@user = User.create!(email: "test@testing.com", password: "somepassword", nome: "utente test")

	    visit "/"

	    click_button "Clicca qui per accedere con Microsoft"
	    expect(current_path).to eq(root_path)

	    expect(page).to have_content "Sign in con Microsoft completato con successo!"
	    expect(page).to have_content "utente test"

	    click_link "#{@user.nome}"

	  end

	  private

	end
end
