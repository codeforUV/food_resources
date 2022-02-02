class ServicesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end
  
  def new
    @service = Service.new
  end

  def create
    @service = current_user.services.build(service_params)
    if @service.save 
      redirect_to service_path(@service)
    else
      render 'edit'
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)
    if @service.save 
      puts "It saved?"
      redirect_to service_path(@service)
    else
      render 'edit'
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to root_path
  end

  private 

  def service_params 
    params.require(:service).permit(:name, :address, :city, :state_province, :postal_code, :number, :url)
  end
end
