class SubjectsController < ApplicationController

  layout "admin"

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count+1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      #redirect
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')
    else
      #redisplay form, validation
      @subject_count = Subject.count+1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      #redirect
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'index')
    else
      #redisplay form, validation
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :position, :visible, :created_at)
    end
end
