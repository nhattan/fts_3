module Admin::CsvsHelper
  def export_csv model
    CSV.generate do |csv|
      csv << model.constantize.column_names
      model.constantize.all.each do |data|
        csv << data.attributes.values_at(*model.constantize.column_names)
      end
    end
  end

  def import_csv model, file
    CSV.foreach(file.path, headers: true) do |row|
      row_hash = row.to_hash
      record = model.constantize.where id: row[0]
      model.constantize.create row_hash if record.count == 0
    end
  end
end