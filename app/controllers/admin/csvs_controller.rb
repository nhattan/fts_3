class Admin::CsvsController < ApplicationController
  include Admin::CsvsHelper

  def index
    @models = []
    ActiveRecord::Base.connection.tables.each do |table|
      @models << table.camelize.singularize
    end
  end

  def export
    model = params[:model]
    respond_to do |format|
      format.csv { send_data export_csv(model), filename: "#{model}.csv" }
    end
  end

  def import
    model = params[:model]
    if params[:file].present?
      import_csv(model, params[:file])
      flash[:success] = "#{model} imported!"
    else
      flash[:error] = "You must chosen file to import!"
    end
    redirect_to :back
  end
end