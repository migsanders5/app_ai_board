class JobsController < ApplicationController
  def index
    Job.where("deadline < ?", Date.today).destroy_all

    @sort = params.fetch("sort", "created_at")
    @tag_filter = params.fetch("tag", "")

    @list_of_jobs = Job.all

    if @tag_filter.present?
      @list_of_jobs = @list_of_jobs.joins(:tags).where(tags: { tag: @tag_filter })
    end

    if @sort == "deadline"
      @list_of_jobs = @list_of_jobs.order(deadline: :asc)
    else
      @list_of_jobs = @list_of_jobs.order(created_at: :desc)
    end

    @all_tags = Tag.distinct.pluck(:tag).sort

    render({ :template => "job_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_jobs = Job.where({ :id => the_id })

    @the_job = matching_jobs.at(0)

    render({ :template => "job_templates/show" })
  end

  def create
    the_job = Job.new
    the_job.title = params.fetch("query_title")
    the_job.company = params.fetch("query_company")
    the_job.application_url = params.fetch("query_application_url")
    the_job.deadline = params.fetch("query_deadline")

    if the_job.valid?
      the_job.save
      tag_name = params.fetch("query_tag", "").strip
      if tag_name.present?
        Tag.create(job_id: the_job.id, tag: tag_name)
      end
      redirect_to("/jobs", { :notice => "Job created successfully." })
    else
      redirect_to("/jobs", { :alert => the_job.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.title = params.fetch("query_title")
    the_job.company = params.fetch("query_company")
    the_job.application_url = params.fetch("query_application_url")
    the_job.deadline = params.fetch("query_deadline")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs/#{the_job.id}", { :notice => "Job updated successfully." } )
    else
      redirect_to("/jobs/#{the_job.id}", { :alert => the_job.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.destroy

    redirect_to("/jobs", { :notice => "Job deleted successfully." } )
  end
end
