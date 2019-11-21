class NotesController < ApplicationController
  include GraphHelper

  def index
    @@notebook = get_notebook_id

    section = nil
    page = nil
    parola_chiave = nil
    
    @notes = search_onenote_page current_user.token || [], @@notebook, section, page, parola_chiave
  
    @sections_for_search = search_onenote_section current_user.token || [], @@notebook, section
    
    rescue RuntimeError => e
      @errors = [
        {
          message: 'Microsoft Graph returned an error getting events.',
          debug: e
        }
      ]
  end

  def search
    @@notebook = get_notebook_id

    section = nil
    page = nil
    date = nil
    
    if params[:section].present?
      section = params[:section]
    end

    if params[:page].present?
      page = params[:page]
    end

    if params[:date].present?
      date = params[:date]
    end

    @notes = search_onenote_page current_user.token || [], @@notebook, section, page, date
  
    @sections_for_search = search_onenote_section current_user.token || [], @@notebook, section

    rescue RuntimeError => e
      @errors = [
        {
          message: 'Microsoft Graph returned an error getting events.',
          debug: e
        }
      ]
  end

  def new
    @@notebook = get_notebook_id
    @@sections = get_onenote_sections current_user.token || [], @@notebook
    @sections_for_select = @@sections
    
    rescue RuntimeError => e
      @errors = [
        {
          message: 'Microsoft Graph returned an error getting events.',
          debug: e
        }
      ]
  end

  def create_page
    page = params[:page]
    section = params[:selected_section]
    section_id = ""
    for s in @@sections do
      if s['displayName'] == section
        section_id = s['id']
        break
      end
    end
    response = create_onenote_page current_user.token || [], page, section_id, @@notebook
    if response.code == 201
      flash[:success] = 'Nota creata con successo!'   
      redirect_to new_note_path   
    else   
      flash[:error] = 'Si è verificato un errore: nota non creata!'   
      redirect_to new_note_path   
    end 
  end

  def create_section
    @section = params[:section]
    response = create_onenote_section current_user.token || [], @section, @@notebook
    if response.code == 201
      flash[:success] = 'Materia creata con successo!'   
      redirect_to new_note_path   
    else   
      flash[:error] = 'Si è verificato un errore: materia non creata!'   
      redirect_to new_note_path   
    end 
  end

  def destroy
    response = delete_onenote_page current_user.token || [], params[:id]
    if response.code == 204
      flash[:success] = 'Nota eliminata con successo!'   
      redirect_to notes_search_path   
    else   
      flash[:error] = 'Si è verificato un errore: nota non eliminata!'   
      redirect_to notes_search_path   
    end   
  end   

  def destroy_section
    response = delete_onenote_section current_user.token || [], params[:id]
    if response.code == 204
      flash[:success] = 'Materia eliminata con successo!'   
      redirect_to notes_search_path   
    else   
      flash[:error] = 'Si è verificato un errore: materia non eliminata!'   
      redirect_to notes_search_path   
    end   
  end   

end