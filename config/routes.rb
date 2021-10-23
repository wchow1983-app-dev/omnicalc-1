Rails.application.routes.draw do

#this is where we set up the layout for 1) URL for each specific page, 2) instrucions to direct us to the 
#"application_controller.rb" file containing our "action" instructions, and 3) selects from the list of 
#"actions" or methods in our "application_controller.rb" to determine whether we are "rendering" or 
#"redirecting_to".

  get("/square/new", {:controller => "application", :action => "blank_square_form"})
  
  get("/square_root/new", {:controller => "application", :action => "blank_square_root_form"})

  get("/payment/new", {:controller => "application", :action => "blank_payment_form"})
  
  get("/random/new", {:controller => "application", :action => "blank_random_form"})

end
