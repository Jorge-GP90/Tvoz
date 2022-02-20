module StudentAudiosHelper
    def choose_url_new_or_edit
        if action_name == 'new'
            task_student_audios_path
        elsif action_name == 'edit'
            edit_task_student_audio_path
        end
    end

    def choose_method_new_or_edit
        if action_name == 'new'
            :post
        elsif action_name == 'edit'
            :get
        end
    end
end
