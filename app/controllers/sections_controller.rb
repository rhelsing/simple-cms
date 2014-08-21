class SectionsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in
  before_action :find_page

  def index
    #@sections = Section.sorted
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:page_id => @page.id, :name => "Default"})
    @pages = @page.subject.pages.sorted
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      @pages = Page.order('position ASC')
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.order('position ASC')
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      @pages = Page.order('position ASC')
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(:action => 'index', :page_id => @page.id)
  end


  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :context)
  end

  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end
  end

end
