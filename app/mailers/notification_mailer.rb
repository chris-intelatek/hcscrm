class NotificationMailer < ApplicationMailer
    def new_hcsq(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'chris@intelatek.com'],
             subject: 'New HCSQ Submitted')
    end
    
    def new_meeting(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'appointments@intelatek.com'],
             subject: 'New HCS Meeting Scheduled')
    end
    
    def new_comment(comment)
        @comment = comment
        mail(to: comment.prospect.user_email,
             subject: 'New Comment Submitted')
    end
end