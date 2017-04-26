class SnippetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_snippet, only: [:show, :edit, :update, :destroy]

  def index
    @snippets = Snippet.all
    @kinds = Kind.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new snippet_params
    @snippet.user = current_user
    if @snippet.save
      redirect_to snippet_path(@snippet), notice: 'Snippet created'
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path, alert: 'Access denied' unless can? :edit, @snippet
  end

  def update
    redirect_to root_path, alert: 'Access denied' unless can? :edit, @snippet
    if @snippet.update(snippet_params)
      redirect_to snippet_path(@snippet), notice: 'Snippet Updated'
    else
      render :edit
    end
  end

  def destroy
    if can? :destroy, @snippet
      @snippet.destroy
      redirect_to snippets_path, notice: 'Snippet Deleted'
    else
      redirect_to root_path, alert: 'Access denied'
    end
  end

  private

    def find_snippet
      @snippet = Snippet.find params[:id]
    end

    def snippet_params
      params.require(:snippet).permit([:kind_id, :title, :work, :is_private])
    end

end
