class NotificationMailer < ApplicationMailer
    def new_hcsq(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'chris@bluecoastsavings.com'],
             subject: 'New HCSQ Submitted')
    end

    def new_branch_lead(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'chris@bluecoastsavings.com', 'gunruh@unruhenterprises.com', 'shawn@bluecoastsavings.com'],
             subject: 'New Lead Submitted to Branch')
    end

    def new_pay(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'gunruh@unruhenterprises.com'],
             subject: 'New Blue Coast Instant Pay Lead')
    end

    def new_meeting(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'appointments@intelatek.com'],
             subject: 'New HCS Meeting Scheduled')
    end

    def new_hcs_meeting(prospect)
        @prospect = prospect
        mail(from: "info@healthcaresavings.co",
              to: [prospect.contact1_email, prospect.user_email],
              subject: 'healthcare savings')
    end

    def new_comment(comment)
        @comment = comment
        mail(to: [comment.prospect.user_email],
             subject: 'New Comment Submitted')
    end
end