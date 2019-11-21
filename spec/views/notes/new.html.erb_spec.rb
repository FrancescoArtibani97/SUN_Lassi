require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
 	@sections_for_select =[{"id" => "000","displayName"=> "Elettronica"},{"id" => "001","displayName"=> "LASSI"}]
  end
  it "form for new section" do	
    
    render

    expect(rendered).to have_tag("label",:text => "Nuova Materia:")
    expect(rendered).to have_tag("input", :with => { :name =>"section", :type => "text", :id => "section" }) 
  	expect(rendered).to have_tag("input", :with => { :type => "submit", :name => "commit", :value => "Crea", :class => "btn btn-secondary btn-lg add_button"})
  end

  it "form for new page (give the section)" do
 	
    render

    expect(rendered).to have_tag("label",:text => "Titolo Nuova Nota:")
    expect(rendered).to have_tag("input", :with => { :name =>"page", :type => "text", :id => "page" }) 
    expect(rendered).to have_tag("label",:text => "Contenuta in:")
    expect(rendered).to have_tag("select", :with => { :name =>"selected_section", :id => "selected_section" })  { with_tag("option", :text => "Elettronica") }
    expect(rendered).to have_tag("select", :with => { :name =>"selected_section", :id => "selected_section" })  { with_tag("option", :text => "LASSI") }   
 	  expect(rendered).to have_tag("input", :with => { :type => "submit", :name => "commit", :value => "Crea", :class => "btn btn-secondary btn-lg add_button"})
  end
end
