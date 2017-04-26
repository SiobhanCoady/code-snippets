class KindsController < ApplicationController
  def show
    @snippets = Snippet.where("kind_id= ? AND is_private = ?", params[:id], false)
  end
end
