class WelcomeController < ApplicationController
  def index
    @noms = Noms.take(5)
    @vending = Noms.take(10)
    # need to add function
  end
end
