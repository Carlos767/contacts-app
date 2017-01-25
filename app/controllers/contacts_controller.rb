class ContactsController < ApplicationController

  def contacts
    @contacts = Contact.all
    render "contacts.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    contact = Contact.create(
      first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email]
      phone: params[:phone]
      image: params[:image])
    flash[:success] = "Contact successfully created!"
    redirect_to "/contacts/#{contact_id}"
  end

  def show
  contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render "show.html.erb"
  end

  def edit
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render "edit.html.erb"
  end

  def update
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id)
    contact.update(
      first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email]
      phone: params[:phone]
      image: params[:image])
    flash[:success] = "Contact successfully updated!"
    redirect_to "/contacts/#{contact_id}"
  end

  def destroy
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id)
    contact.destroy
    flash[:success] = "Contact successfully deleted!"
    redirect_to "/contacts/#{contact_id}"
  end
    
end
