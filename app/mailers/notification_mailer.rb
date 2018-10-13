class NotificationMailer < ApplicationMailer
    def new_bchq(prospect)
        @prospect = prospect
        mail(to: 'chris@intelatek.com',
             subject: 'New BCHQ Submitted')
    end
    
    def new_meeting(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'chris@intelatek.com'],
             subject: 'New Meeting Scheduled')
    end
    
    def new_comment(comment)
        @comment = comment
        mail(to: comment.prospect.user_email,
             subject: 'New Comment Submitted')
    end
end