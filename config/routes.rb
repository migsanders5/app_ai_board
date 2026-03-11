Rails.application.routes.draw do
  # routes for rsvps:

  post("/create_rsvp", { :controller => "rsvps", :action => "create" })

  get("/rsvps", { :controller => "rsvps", :action => "index" })

  get("/rsvps/:path_id", { :controller => "rsvps", :action => "show" })

  post("/modify_rsvp/:path_id", { :controller => "rsvps", :action => "update" })

  get("/delete_rsvp/:path_id", { :controller => "rsvps", :action => "destroy" })

  

  # routes for meetings:

  post("/create_meeting", { :controller => "meetings", :action => "create" })

  get("/meetings", { :controller => "meetings", :action => "index" })

  get("/meetings/:path_id", { :controller => "meetings", :action => "show" })

  post("/modify_meeting/:path_id", { :controller => "meetings", :action => "update" })

  get("/delete_meeting/:path_id", { :controller => "meetings", :action => "destroy" })

  

  # routes for tags:

  post("/create_tag", { :controller => "tags", :action => "create" })

  get("/tags", { :controller => "tags", :action => "index" })

  get("/tags/:path_id", { :controller => "tags", :action => "show" })

  post("/modify_tag/:path_id", { :controller => "tags", :action => "update" })

  get("/delete_tag/:path_id", { :controller => "tags", :action => "destroy" })

  

  # routes for comments:

  post("/create_comment", { :controller => "comments", :action => "create" })

  get("/comments", { :controller => "comments", :action => "index" })

  get("/comments/:path_id", { :controller => "comments", :action => "show" })

  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })

  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  

  # routes for articles:

  post("/create_article", { :controller => "articles", :action => "create" })

  get("/articles", { :controller => "articles", :action => "index" })

  get("/articles/:path_id", { :controller => "articles", :action => "show" })

  post("/modify_article/:path_id", { :controller => "articles", :action => "update" })

  get("/delete_article/:path_id", { :controller => "articles", :action => "destroy" })

  

  # routes for jobs:

  post("/create_job", { :controller => "jobs", :action => "create" })

  get("/jobs", { :controller => "jobs", :action => "index" })

  get("/jobs/:path_id", { :controller => "jobs", :action => "show" })

  post("/modify_job/:path_id", { :controller => "jobs", :action => "update" })

  get("/delete_job/:path_id", { :controller => "jobs", :action => "destroy" })


  devise_for :users
  root "meetings#index"
end
