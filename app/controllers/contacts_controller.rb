class ContactsController < ApiController
  before_filter :find_user
  def index
    render json: @user.contacts.all
  end
  def create
    contact = @user.contacts.new(contact_params)
    if contact.save
      render status: 200, json: {
        message: "Successfully created contact.",
        contact: contact
      }.to_json
    else
      render status: 422, json: {
        errors: contact.errors
      }.to_json
    end
  end

  def update
    contact = @user.contacts.find(params[:id])
    if contact.update(user_params)
      render status: 200, json: {
        message: "Successfully updated contact.",
        contact: contact
      }.to_json
    else
      render status: 422, json: {
        message: "Contact couldn't be updated."
      }.to_json
    end
  end

  def destroy
    contact = @user.contacts.find(params[:id])
    contact.destroy
render status: 200, json: {
      message: "Successfully deleted contact."
    }.to_json
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end

  def contact_params
    params.permit("name", "location", "contactTimezone", "localTime")
  end
end