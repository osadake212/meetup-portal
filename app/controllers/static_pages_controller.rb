class StaticPagesController < ApplicationController
  def home
    @meetups = Meetup.where('start_date >= ?', DateTime.now).order('start_date DESC').limit(5)
    @microposts = Micropost.order('created_at DESC').limit(10)
  end

  def about
  end

  def contact
  end
end
