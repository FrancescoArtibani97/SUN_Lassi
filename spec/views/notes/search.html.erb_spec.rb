require 'rails_helper'

RSpec.describe "notes/search", type: :view do

	before(:each) do
    #initialize @notes and @sectiom_for_search for simulate their access to oneNote
		@notes = [{"id" => "000", "title" => "Lezione_Prova_Elettronica", "parentSection"=>{"displayName" => "Elettronica", "links"=>{"oneNoteWebUrl"=>{"href" => "indirizzo_Elettronica"}}}, "links"=>{"oneNoteWebUrl"=>{"href"=>"indirizzo_nota_Elettronica"}}},{"id" => "001", "title" => "Lezione_Prova_Lassi", "parentSection"=>{"displayName" => "LASSI", "links"=>{"oneNoteWebUrl"=>{"href"=>"indirizzo_LASSI"}}}, "links" =>{"oneNoteWebUrl" => {"href" => "indirizzo_nota_LASSI"}}}]
 		@sections_for_search =[{"id" => "000","displayName"=> "Elettronica", "links"=>{"oneNoteWebUrl"=>{"href" => "indirizzo_Elettronica"}}},{"id" => "001","displayName"=> "LASSI", "links"=>{"oneNoteWebUrl"=>{"href"=>"indirizzo_LASSI"}}}]
  		render
  	end

  it "form for find section" do	
    expect(rendered).to have_tag("label",:text => "Materia:")
    have_form("/notes/search", "get") {with_tag("input", :with => { "name" => "section", "placeholder" => "Inserisci il nome della materia..."}) }
  	expect(rendered).to have_tag("input", :with => { :type => "submit", :name => "commit", :value => "Cerca"})
  end

  it "form for find page" do	
    
    expect(rendered).to have_tag("label",:text => "Titolo:")
    have_form("/notes/search", "get") {with_tag("input", :with => { "name" => "page", "placeholder" => "Inserisci il titolo della nota..."}) }
  end

  #it "find for keyword" do	
   # expect(rendered).to have_tag("label",:text => "Parola Chiave:")
    #have_form("/notes/search", "get") {with_tag("input", :with => { "name" => "parola_chiave", "placeholder" => "Inserisci una parola chiave..."}) }
  #end

  it "FIND and READ notes given the sections and its corrispondent notes" do	
  	#materia => Elettronica, #Nota => Lezione_Prova_Elettronica
    expect(rendered).to have_tag("button"){with_tag("h4", :text => "Elettronica")}
    expect(rendered).to have_tag("li"){with_tag("h5", :text => "Lezione_Prova_Elettronica")}
    expect(rendered).to have_tag("li"){with_tag("a", :text => "Apri", :with =>{"href" => "indirizzo_nota_Elettronica"})}
    expect(rendered).to have_tag("li"){with_tag("a", :text => "Apri in una nuova pagina", :with =>{"href" => "indirizzo_nota_Elettronica", "target" => "_blank"})}
    
    #materia => LASSI, #Nota => Lezione_Prova_LASSI
    expect(rendered).to have_tag("button"){with_tag("h4", :text => "LASSI")}
   	expect(rendered).to have_tag("li"){with_tag("h5", :text => "Lezione_Prova_Lassi")}
    expect(rendered).to have_tag("li"){with_tag("a", :text => "Apri", :with =>{"href" => "indirizzo_nota_LASSI"})}
    expect(rendered).to have_tag("li"){with_tag("a", :text => "Apri in una nuova pagina", :with =>{"href" => "indirizzo_nota_LASSI", "target" => "_blank"})}
  end

  it "DELETE notes given the sections and its corrispondent notes" do	
  	#materia => Elettronica, #Nota => Lezione_Prova_Elettronica
    expect(rendered).to have_tag("li"){with_tag("a", :text => "Elimina", :with =>{"href" => "/notes/000", "rel" => "nofollow"})}
    #materia => LASSI, #Nota => Lezione_Prova_LASSI
    expect(rendered).to have_tag("li"){with_tag("a", :text => "Elimina", :with =>{"href" => "/notes/001", "rel" => "nofollow"})}
  end
end
