class DemoController < ApplicationController
	layout false
  def index
  end

  def hello #defaults to rendering demo#hello.html.erb view
  	@array = [1,2,3,4,5]#immediately available in view
  	@id = params[:id]#can use string or symbol
  	@page = params['page']#can use string or symbol
  end

  def redirect
  	#either redirect or render view template
  	redirect_to(:controller => 'demo', :action => 'index')#could leave off controller
  end

  def text_helpers
  end

end
