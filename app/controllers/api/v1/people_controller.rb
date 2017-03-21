module Api
  module V1
    class PeopleController < ApplicationController
      respond_to :json

        def index
          @people = Person.all
          respond_with (@people)
        end

        def show
          @person = Person.find(params[:id])
          respond_with (@person)
        end

        def create
          @person = Person.create(person_params)
          respond_with (@person)
        end

        def update
          @person = Person.find(params[:id])
          @person.update(person_params)
          respond_with (@person)
        end

        def destroy
          @person = Person.destroy(params[:id])
        end

        private

        def person_params
          params.require(:person).permit(:name, :favoriteCity)
        end
    end
 end
end
