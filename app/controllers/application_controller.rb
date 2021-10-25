class ApplicationController < ActionController::Base
  layout("application.html.erb")
  
  #get("/add", { :controller => "application", :action => "addition_form" })
  #get("/subtract", { :controller => "application", :action => "subtraction_form" })
  #get("/multiply", { :controller => "application", :action => "multiplication_form" })
  #get("/divide", { :controller => "application", :action => "division_form" })

  def addition_form
    render ({ :template => "calculation_templates/addition_form.html.erb"})
  end

  def subtraction_form
    render ({ :template => "calculation_templates/subtraction_form.html.erb"})
  end

  def multiplication_form
    render ({ :template => "calculation_templates/multiplication_form.html.erb"})
  end

  def division_form
    render ({ :template => "calculation_templates/division_form.html.erb"})
  end

  #get("/wizard_add", { :controller => "application", :action => "addition_result" })
  #get("/wizard_subtract", { :controller => "application", :action => "subtraction_result" })
  #get("/wizard_multiply", { :controller => "application", :action => "multiplication_result" })
  #get("/wizard_divide", { :controller => "application", :action => "division_result" })

  #formatting:
  #@number_1 = @number_1.to_s(:percentage, { :precision => 4 } )
  #@number_2 = @number_2.to_s(:percentage, { :precision => 2 } )
  #@sum = @sum.to_s(:currency)

  def addition_result

    @number_1  = params.fetch("first_num").to_f
    @number_2  = params.fetch("second_num").to_f
    @sum = @number_1 + @number_2

    render({ :template => "calculation_templates/addition_result.html.erb"})
  end
  
  def subtraction_result

    @number_1  = params.fetch("first_num").to_f
    @number_2  = params.fetch("second_num").to_f
    @difference = @number_1 - @number_2

    render({ :template => "calculation_templates/subtraction_result.html.erb"})
  end

  def multiplication_result

    @number_1  = params.fetch("first_num").to_f
    @number_2  = params.fetch("second_num").to_f
    @product = @number_1 * @number_2

    render({ :template => "calculation_templates/multiplication_result.html.erb"})
  end

  def division_result

    @number_1  = params.fetch("first_num").to_f
    @number_2  = params.fetch("second_num").to_f
    @quotient = @number_1 / @number_2

    render({ :template => "calculation_templates/division_result.html.erb"})
  end
end
