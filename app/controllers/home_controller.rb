class HomeController < ApplicationController
  def index
  end

  def about
    @name = "Richard She"
    @intern = "JLL"
    @dislikes = "cicada"
  end
end
