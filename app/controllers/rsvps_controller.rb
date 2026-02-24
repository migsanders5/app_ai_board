class RsvpsController < ApplicationController
  def index
    matching_rsvps = Rsvp.all

    @list_of_rsvps = matching_rsvps.order({ :created_at => :desc })

    render({ :template => "rsvp_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_rsvps = Rsvp.where({ :id => the_id })

    @the_rsvp = matching_rsvps.at(0)

    render({ :template => "rsvp_templates/show" })
  end

  def create
    the_rsvp = Rsvp.new
    the_rsvp.user_id = current_user.id
    the_rsvp.meeting_id = params.fetch("query_meeting_id")
    the_rsvp.going = params.fetch("query_going")

    if the_rsvp.valid?
      the_rsvp.save
      redirect_to("/meetings/#{the_rsvp.meeting_id}", { :notice => "Rsvp created successfully." })
    else
      redirect_to("/meetings/#{the_rsvp.meeting_id}", { :alert => the_rsvp.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_rsvp = Rsvp.where({ :id => the_id }).at(0)

    the_rsvp.user_id = params.fetch("query_user_id")
    the_rsvp.meeting_id = params.fetch("query_meeting_id")
    the_rsvp.going = params.fetch("query_going")

    if the_rsvp.valid?
      the_rsvp.save
      redirect_to("/rsvps/#{the_rsvp.id}", { :notice => "Rsvp updated successfully." } )
    else
      redirect_to("/rsvps/#{the_rsvp.id}", { :alert => the_rsvp.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_rsvp = Rsvp.where({ :id => the_id }).at(0)

    the_meeting_id = the_rsvp.meeting_id
    the_rsvp.destroy

    redirect_to("/meetings/#{the_meeting_id}", { :notice => "Rsvp deleted successfully." } )
  end
end
