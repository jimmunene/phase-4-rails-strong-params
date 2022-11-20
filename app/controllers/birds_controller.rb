class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    # bird = Bird.create(name: params[:name], species: params[:species])
    # What we can do instead is use [Strong Parameters][strong params] to **permit**_only_ the parameters that we want to use:
    # bird = Bird.create(params.permit(:name, :species))
    # When we call `params.permit(:name, :species)`, this will return a new hash with **only** the name and species keys. Rails will also mark this new hash as `permitted`, which means we can safely use this new hash for mass assignment.
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private
  # all methods below here are private

  def bird_params
    byebug
    params.permit(:name, :species)
  end

end