class MeetingsController < ApplicationController
  def index
    @upcoming_meetings = Meeting.where("date >= ?", Date.today).order(date: :asc)
    @past_meetings     = Meeting.where("date < ?",  Date.today).order(date: :desc)

    render({ :template => "meeting_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_meetings = Meeting.where({ :id => the_id })

    @the_meeting = matching_meetings.at(0)

    @list_of_rsvps = @the_meeting.rsvps
    @current_user_rsvp = Rsvp.find_by(user_id: current_user.id, meeting_id: @the_meeting.id)

    render({ :template => "meeting_templates/show" })
  end

  def create
    the_meeting = Meeting.new
    the_meeting.date = params.fetch("query_date")
    the_meeting.time = params.fetch("query_time")
    the_meeting.meeting_name = params.fetch("query_meeting_name")

    if the_meeting.valid?
      the_meeting.save
      redirect_to("/meetings", { :notice => "Meeting created successfully." })
    else
      redirect_to("/meetings", { :alert => the_meeting.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_meeting = Meeting.where({ :id => the_id }).at(0)

    the_meeting.date = params.fetch("query_date")
    the_meeting.time = params.fetch("query_time")
    the_meeting.meeting_name = params.fetch("query_meeting_name")

    if the_meeting.valid?
      the_meeting.save
      redirect_to("/meetings/#{the_meeting.id}", { :notice => "Meeting updated successfully." } )
    else
      redirect_to("/meetings/#{the_meeting.id}", { :alert => the_meeting.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_meeting = Meeting.where({ :id => the_id }).at(0)

    the_meeting.destroy

    redirect_to("/meetings", { :notice => "Meeting deleted successfully." } )
  end
end
