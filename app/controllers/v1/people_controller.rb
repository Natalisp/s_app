module V1
class PeopleController < ApplicationController
   before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
    @person = Person.new
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @people.to_json(only: [:id, :name, :favoriteCity]) }
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @person.to_json(only: [:id, :name, :favoriteCity]) }
    end
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = "#{@person.name} was created."
      redirect_to person_path(@person)
    else
     @people = Person.all
     render :action => :index
   end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      flash[:notice] = "#{@person.name} was updated."
    else
      flash[:notice] = "Couldn't update the record. Sorry"
    end
    redirect_to person_path(@person)
  end

  def destroy
    @person.destroy
    flash[:notice] = "#{@person.name} was deleted."
    redirect_to people_path
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :favoriteCity)
  end
 end
end
