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
    # @dog.user = current_user
    @dog.save
  end

   private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :description)
  end
end
