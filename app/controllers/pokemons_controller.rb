class PokemonsController < ApplicationController

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
end
