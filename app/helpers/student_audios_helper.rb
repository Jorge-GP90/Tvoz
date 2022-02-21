module StudentAudiosHelper
    def choose_url
        if action_name == 'new'
            task_student_audios_path
        elsif action_name == 'edit'
            edit_task_student_audio_path
        # elsif action_name == 'update'
            # task_student_audio
        # elsif action_name == 'show'
            # task_student_audio
        # elsif action_name == 'destroy'
            # task_student_audio
        end
    end

    def choose_method
        if action_name == 'new'
            :post
        elsif action_name == 'edit'
            :get
        # elsif action_name == 'show'
        #     :get
        # elsif action_name == 'udpate'
        #     :patch
        # elsif action_name == 'destroy'
        #     :delete
        end
    end
end
