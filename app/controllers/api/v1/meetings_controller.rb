class Api::V1::MeetingsController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    @meetings = Meeting.all
    render :json => {:meetings => @meetings}
  end
end
