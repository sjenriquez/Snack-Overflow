class WelcomeController < ApplicationController
  def index
    @noms_most_recent = Nom.most_recent
    @noms_most_popular = Nom.most_popular
    @vending = Nom.vend_ten
  end
end
