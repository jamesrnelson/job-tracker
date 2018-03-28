class ContactsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    @contact.save
    redirect_to company_path(@company)
  end

  def edit
    @contact = Contact.find(params[:id])
    @company = @contact.company
  end

  def update
    @contact = Contact.find(params[:id])
    @company = @contact.company
    @contact.update(contact_params)
    if @contact.save
      flash.notice = "Contact '#{@contact.name}' was updated."
      redirect_to company_path(@company)
    else
      flash.notice = 'Contact was NOT updated. Please do not leave any fields blank.'
      render :edit
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
