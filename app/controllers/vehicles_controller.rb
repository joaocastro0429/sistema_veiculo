class VehiclesController < ApplicationController
    def index
      @vehicles = Vehicle.all
    end
  
    def show
      @vehicle = Vehicle.find(params[:id])
    end
  
    def new
      @vehicle = Vehicle.new
    end
  
    def create
      @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        redirect_to @vehicle
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @vehicle = Vehicle.find(params[:id])
    end
  
    def update
      @vehicle = Vehicle.find(params[:id])
  
      if @vehicle.update(vehicle_params)
        redirect_to @vehicle
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @vehicle = Vehicle.find(params[:id])
      @vehicle.destroy
      redirect_to root_path, notice: "Veículo excluído com sucesso."
    end
  
    private
  
    def vehicle_params
      params.require(:vehicle).permit(:model, :brand, :year, :plate, :color)
    end
  end
  