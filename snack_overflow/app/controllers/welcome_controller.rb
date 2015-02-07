class WelcomeController < ApplicationController
  def index
    @noms = Nom.take(5)
    @vending = Nom.vend_ten
    # need to add function
  end
end
