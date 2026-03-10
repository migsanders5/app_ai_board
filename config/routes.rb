Rails.application.routes.draw do
  # routes for rsvp:

  post("/make_rsvp", { :controller => "rsvps", :action => "create" })

  get("/rsvps", { :controller => "rsvps", :action => "index" })

  get("/rsvps/:path_id", { :controller => "rsvps", :action => "show" })

  

  post("/modify_rsvp/:path_id", { :controller => "rsvps", :action => "update" })

  # DELETE
  get("/delete_rsvp/:path_id", { :controller => "rsvps", :action => "destroy" })

  

  # Routes for the Meeting resource:

  # CREATE
  post("/insert_meeting", { :controller => "meetings", :action => "create" })

  # READ
  get("/meetings", { :controller => "meetings", :action => "index" })

  get("/meetings/:path_id", { :controller => "meetings", :action => "show" })

  # UPDATE

  post("/modify_meeting/:path_id", { :controller => "meetings", :action => "update" })

  # DELETE
  get("/delete_meeting/:path_id", { :controller => "meetings", :action => "destroy" })

  

  # Routes for the Tag resource:

  # CREATE
  post("/insert_tag", { :controller => "tags", :action => "create" })

  # READ
  get("/tags", { :controller => "tags", :action => "index" })

  get("/tags/:path_id", { :controller => "tags", :action => "show" })

  # UPDATE

  post("/modify_tag/:path_id", { :controller => "tags", :action => "update" })

  # DELETE
  get("/delete_tag/:path_id", { :controller => "tags", :action => "destroy" })

  

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })

  get("/comments/:path_id", { :controller => "comments", :action => "show" })

  # UPDATE

  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })

  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  

  # Routes for the Article resource:

  # CREATE
  post("/insert_article", { :controller => "articles", :action => "create" })

  # READ
  get("/articles", { :controller => "articles", :action => "index" })

  get("/articles/:path_id", { :controller => "articles", :action => "show" })

  # UPDATE

  post("/modify_article/:path_id", { :controller => "articles", :action => "update" })

  # DELETE
  get("/delete_article/:path_id", { :controller => "articles", :action => "destroy" })

  

  # Routes for the Job resource:

  # CREATE
  post("/insert_job", { :controller => "jobs", :action => "create" })

  # READ
  get("/jobs", { :controller => "jobs", :action => "index" })

  get("/jobs/:path_id", { :controller => "jobs", :action => "show" })

  # UPDATE

  post("/modify_job/:path_id", { :controller => "jobs", :action => "update" })

  # DELETE
  get("/delete_job/:path_id", { :controller => "jobs", :action => "destroy" })

  #------------------------------

  devise_for :users
  root "meetings#index"
end
