class StaticPagesController < ApplicationController
  def home
    @meetups = Meetup.limit(5)
    @microposts = Micropost.limit(10)
  end

  def about
  end

  def contact
  end
end
