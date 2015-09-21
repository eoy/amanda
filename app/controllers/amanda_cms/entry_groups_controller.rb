require_dependency "amanda_cms/application_controller"

module AmandaCms
  class EntryGroupsController < ApplicationController
    def index
      @entry_groups = EntryGroup.all + Entry.descendants
    end

    def new
      @entry_group = EntryGroup.new
    end

    def create
      @entry_group = EntryGroup.new(entry_group_params)
      json_fields = JSON.parse(params[:entry_group][:fields])
      @entry_group.define_entry_type(params[:entry_group][:title], json_fields)

      if @entry_group.save
        redirect_to root_path, notice: 'Entry-type was successfully created.'
      else
        render :new
      end
    end


    private

    def entry_group_params
      params.require(:entry_group).permit(:title)
    end
  end
end