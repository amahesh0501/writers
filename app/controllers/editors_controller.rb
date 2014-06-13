class EditorsController < ApplicationController

  def index
    @editors = Editor.all
  end

  def show
    @editor = Editor.find(params[:id])
  end

  def new
    @editor = Editor.new
  end

  def create
    @editor = Editor.new(params[:editor])
    if @editor.save
      redirect_to editor_path(@editor)
    else
      flash.now[:errors] = @editor.errors.full_messages
      render :new
    end
  end

  def edit
    @editor = Editor.find(params[:id])
  end

  def update
    editor = Editor.find(params[:id])
    if editor.update_attributes(params[:editor])
      redirect_to editor_path(editor)
    else
      flash.now[:errors] = editor.errors.full_messages
      erb :edit
    end
  end

  def destroy
    editor = Editor.find(params[:id])
    editor.destroy


    redirect_to root_path
  end


end