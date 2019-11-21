require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
  	@sections_for_search =[{"id" => "000","displayName"=> "Elettronica", "links"=>{"oneNoteWebUrl"=>{"href" => "indirizzo_Elettronica"}}},{"id" => "001","displayName"=> "LASSI","links"=>{"oneNoteWebUrl"=>{"href"=>"indirizzo_LASSI"}}}]
  	@notes = [{"id" => "000", "title" => "Lezione_Prova_Elettronica", "parentSection"=>{"displayName" => "Elettronica", "links"=>{"oneNoteWebUrl"=>{"href" => "indirizzo_Elettronica"}}}, "links"=>{"oneNoteWebUrl"=>{"href"=>"indirizzo_nota_Elettronica"}}},{"id" => "001", "title" => "Lezione_Prova_Lassi", "parentSection"=>{"displayName" => "LASSI", "links"=>{"oneNoteWebUrl"=>{"href"=>"indirizzo_LASSI"}}}, "links" =>{"oneNoteWebUrl" => {"href" => "indirizzo_nota_LASSI"}}}]
  end

  it "'cerca nota e nuova nota' in the notes page" do	
    
    render

    expect(rendered).to have_tag("a",:text => "Nuova Nota", :with =>{:class => "btn btn-secondary btn-lg col-4 choice_button", :href => "/notes/new"}) 
    expect(rendered).to have_tag("a",:text => "Cerca Nota", :with =>{:class => "btn btn-secondary btn-lg col-4 choice_button", :href => "/notes/search"})
  end

end
