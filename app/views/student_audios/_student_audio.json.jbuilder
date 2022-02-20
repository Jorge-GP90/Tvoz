json.extract! student_audio, :id, :audio_student, :user_id, :task_id, :created_at, :updated_at
json.url student_audio_url(student_audio, format: :json)
