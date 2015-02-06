class WelcomeController < ApplicationController
  def index
    @noms = Nom.take(5)
    @vending = Nom.take(10)
    # need to add function
  end
end
