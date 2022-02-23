class RemoveContentAndAudioRecordFromTableTask < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :content, :text
    remove_column :tasks, :audio_record, :text
  end
end
