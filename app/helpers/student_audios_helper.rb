module StudentAudiosHelper
    def choose_url
        if action_name == 'new'
            task_student_audios_path
        elsif action_name == 'edit'
            task_student_audio_path
        end
    end

    def choose_method
        if action_name == 'new'
            :post
        elsif action_name == 'edit'
            :patch
        end
    end
end
