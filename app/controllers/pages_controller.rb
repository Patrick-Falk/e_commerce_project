class PagesController < ApplicationController
  def about
    @page = Page.find_by title: 'About'
  end

  def contact
    @page = Page.find_by title: 'Contact Us'
  #   @contact = Contact.all
  end

  def home

  end
end
