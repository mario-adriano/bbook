class AddNotNullToOriginalPublicationYearInBook < ActiveRecord::Migration[7.0]
  def change
    change_column_null :books, :original_publication_year, false
  end
end
