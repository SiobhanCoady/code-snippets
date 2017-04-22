class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
    @kinds = Kind.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new snippet_params
    # @snippet.user = current_user
    if @snippet.save
      redirect_to snippet_path(@snippet), notice: 'Snippet created'
    else
      render :new
    end
  end

  def show
    @snippet = Snippet.find params[:id]
  end

  private

    def snippet_params
      params.require(:snippet).permit([:kind_id, :title, :work])
    end

end
