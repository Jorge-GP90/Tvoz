class CreateStudentAudios < ActiveRecord::Migration[6.0]
  def change
    create_table :student_audios do |t|
      t.text :audio_student
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
