class PokemonsController < ApplicationController

  def new
    @pokemon = Pokemon.new
  end

  def capture
    @pokemon = Pokemon.find params[:id]
    @pokemon.trainer = current_trainer
    @pokemon.save

    redirect_to :root
  end

  def damage
    @pokemon = Pokemon.find params[:id]
    @pokemon.health -= 10
    @pokemon.save
    if @pokemon.health <= 0
        @pokemon.delete
    end
    redirect_to trainer_path(current_trainer)
  end

  def create
    @pokemon = Pokemon.new
    @pokemon.trainer = current_trainer
    @pokemon.name = Pokemon.find params[:name]
    @pokemon.level = 1 #Assuming 1, not random?
    @pokemon.health = 100
    if @pokemon.save
      redirect_to current_trainer
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to new_path
    end
  end

end
