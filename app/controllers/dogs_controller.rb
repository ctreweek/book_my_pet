class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = current_user.id
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render:new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
    redirect_to dog_path(@dog)
  end

  def update
    @dog =Dog.find(params[:id])
    if @dog.update_attributes(dog_params)
        flash[:notice] = 'The dog is successfully updated!'
        redirect_to pages_dashboard_path
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to pages_dashboard_path
  end

   private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :description, :photo)
  end
end
