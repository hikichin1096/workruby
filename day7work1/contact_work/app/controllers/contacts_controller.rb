class ContactsController < ApplicationController

  def

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(Contact_params)
      #redirect_to new_contact_path
      redirect_to "/contacts/new"

  end

  private

  def Contact_params
    param.require(:contact).permit(:name, :email, :content)
  end

end
