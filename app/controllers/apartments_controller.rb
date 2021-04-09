class ApartmentsController < ApplicationController
  def index
    apartments = Apartment.all
    render json: apartments
  end

  def create
    apartment = Apartment.create(apartment_params)
    if apartment.valid?
      render json: apartment
     else
      render json: apartment.errors, status: :unprocessable_entity
     end
  end

  def update
    # apartment = current_user.apartments.find(params[:id])
    apartment = Apartment.find(params[:id])
    apartment.update(apartment_params)
    if apartment.valid?
      render json: apartment
    else
      render json: apartment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    apartment = Apartment.find(params[:id])
    apartment.destroy
    if apartment.valid?
      render json: apartment
    else
      render json: apartment.errors, status: :unprocessable_entity
    end
  end

  private
  # Apartments have: a street designation, a city, state, a manager's name, manager's contact email, monthly rental price, bedrooms, bathrooms, and whether they allow pets
  def apartment_params
    params.require(:apartment).permit(:street, :city, :state, :manager, :email, :price, :bedrooms, :bathrooms, :pets, :user_id)
  end
end
