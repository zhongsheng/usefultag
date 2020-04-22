# frozen_string_literal: true

require_dependency 'usefultag/application_controller'

module Usefultag
  class TagsController < ApplicationController
    before_action :set_usefultag, only: %i[show edit update destroy]
    def index
      @tags = Usefultag::Tag.all
    end

    def show; end

    def edit; end

    def update; end

    def destroy
      @tag.destroy
      redirect_to tags_url, notice: 'Post was successfully destroyed.'
    end

    def new; end
  private

  def set_usefultag
    @tag = Usefultag::Tag.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tag_params
    params.require(:tag).permit(:name)
  end
  end

end
