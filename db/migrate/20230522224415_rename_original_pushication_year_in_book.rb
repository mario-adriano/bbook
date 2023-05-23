class RenameOriginalPushicationYearInBook < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :original_pushication_year, :original_publication_year
  end
end
