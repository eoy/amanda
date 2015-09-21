require_dependency "amanda_cms/application_controller"

module AmandaCms
  class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destroy]

    def index
      @entries = Entry.where(type: entry_type)
    end

    def show
    end

    def new
      @entry = Entry.new(type: entry_type)
    end

    def edit
    end

    def create
      @entry = Entry.new(entry_params)

      if @entry.save
        redirect_to content_entry_path(@entry), notice: 'Entry was successfully created.'
      else
        render :new
      end
    end

    def update
      if @entry.update(entry_params)
        redirect_to content_entry_path(@entry), notice: 'Entry was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @entry.destroy
      redirect_to content_entries_path, notice: 'Entry was successfully destroyed.'
    end

    private

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      allowed_attrs = %i(id type title slug published_at)
        .concat(entry_type.constantize.content_attributes.keys)

      params.require(:entry).permit(*allowed_attrs)
    end

    def entry_type
      @entry_type ||= params[:entry_type].classify
    end
    helper_method :entry_type
  end
end
