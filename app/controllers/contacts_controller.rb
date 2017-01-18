class ContactsController < ApplicationController

  def view_contacts
    @contacts = Contacts.all
    render "contacts.html.erb"
  end
end
