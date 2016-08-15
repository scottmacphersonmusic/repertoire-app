class RenameSuggestionInstrumentToInstrumentName < ActiveRecord::Migration
  def change
    rename_column :suggestions, :instrument, :instrument_name
  end
end
