class PagesController < ApplicationController
  def home
    @title = "home"
  end

  def help
    @title = "help"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
end
