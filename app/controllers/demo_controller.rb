class DemoController < ApplicationController
	layout false
  def index
  	render('hello')#assumes demo directory
  end

  def hello #defaults to rendering demo#hello.html.erb view
  end

  def redirect
  	#either redirect or render view template
  	redirect_to(:controller => 'demo', :action => 'index')#could leave off controller
  end

end
