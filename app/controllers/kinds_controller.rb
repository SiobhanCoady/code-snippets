class KindsController < ApplicationController
  def show
    @snippets = Snippet.where(kind_id: params[:id])
  end
end
