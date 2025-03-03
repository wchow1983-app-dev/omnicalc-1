#for custom controller files, make sure the name of the controller Class (e.g. "ApplicationController" 
#as named in the "routes.rb" file), is correctly done. Use CamelCase. Otherwise, we may see an error 
#message "uninitialized constant...". 

class ApplicationController < ActionController::Base

#we are instructng whether we are using a layout.

  layout("wrapper.html.erb")

#we are defining each of the methods we created for our routes in "routes.rb". Specifically, we are
#instructing the method to render some HTML. However, the HTML  is placed in each specific form 
#template from our "app/views" folder.

#for each render instruction, in "app/views", create the folder "calculation_templates" and form 
#"square_form.html.erb". 

  def blank_square_form
    render ({ :template => "calculation_templates/square_form.html.erb"})
  end

  def blank_square_root_form
    render ({ :template => "calculation_templates/square_root_form.html.erb"})
  end

    def blank_payment_form
    render ({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def blank_random_form
    render ({ :template => "calculation_templates/random_form.html.erb"})
  end
  
#render instructions for the result pages.

  def calculate_square
    
    @num = params.fetch("square_user_input").to_f
    @square_of_num = @num ** 2
    
    render ({ :template => "calculation_templates/square_results.html.erb"})
  end

#we can use the Math tool Ruby provides to different equations towards user input values (ie Math.sqrt(@num)).  

  def calculate_square_root
      
    @num = params.fetch("square_root_user_input").to_f
    @square_root_of_num = Math.sqrt(@num)
    
    render ({ :template => "calculation_templates/square_root_results.html.erb"})
  end

#lines 60-62: fetching the input values and converting the Strings to Float.
#lines 64-66: computing the calculations based on the values provided in lines 60-62.
#lines 68-70: providing the formating for percentages and currency. 

  def calculate_payment

    @apr = params.fetch("apr_user_input").to_f
    @number_years = params.fetch("years_user_input").to_f
    @principal = params.fetch("principal_user_input").to_f

    @numerator = @apr / 100 / 12 * @principal
    @denominator = 1-((1+@apr / 100 / 12)**(-1 * @number_years * 12))
    @payment = (@numerator / @denominator)

    @apr = @apr.to_s(:percentage, { :precision => 4 } )
    @principal = @principal.to_s(:currency)
    @payment = @payment.to_s(:currency, {:precision => 2})

    render ({ :template => "calculation_templates/payment_results.html.erb"})
  end

#for random numbers within a range use "a..b" where "a" = lower number and "b" = upper number.  
# "a..b" includes the value "b", and "a...b" doesn't include the value "b"".

  def calculate_random

    @lower = params.fetch("min_user_input").to_f
    @upper = params.fetch("max_user_input").to_f
    @random_result = rand(@lower..@upper)

    render ({ :template => "calculation_templates/random_results.html.erb"})
  end
end
