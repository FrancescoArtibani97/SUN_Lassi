class SchedulesController < ApplicationController
  include SchedulesHelper
  
  def index
	  @userSchedule = getSchedule	
  end

  def new
    @enroll  = Enroll.new(params[:enroll])
    @materie = Course.all.order("materia ASC").collect { |c| c.materia}
  end

  def edit
  end

  def create
    begin
      @enroll  = Enroll.new(:matricola => current_user.matricola, :materia => params[:enroll][:materia])
      ret = @enroll.save!(:validate => false)
    rescue
      flash[:error] = "Attenzione: Corso già inserito!"
    end
    if ret 
      flash[:success] = "Orario aggiornato: Corso inserito con successo!"
    end
    redirect_to schedules_path
  end
  
  def delete_page
    @del_enroll  = Enroll.new(params[:enroll]) 
	@schedule = Enroll.where(matricola: current_user.matricola).collect { |e| e.materia }
  end		
 
  def delete
	begin
		@del_enroll = Enroll.where(matricola: current_user.matricola, materia: params[:enroll][:materia])
		op = Enroll.delete(@del_enroll)
    end
    if op
		flash[:success] = "Orario aggiornato: Corso rimosso con successo!"
    else
		flash[:error] = "Operazione annullata!"
    end
    redirect_to schedules_path
  end
end
