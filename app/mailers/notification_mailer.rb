class NotificationMailer < ApplicationMailer
    def new_hcsq(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'chris@bluecoastsavings.com,', 'csharp@tridentbenefits.net', 'mvela@tridentbenefits.net'],
             subject: 'New HealthCare Prospect Submitted')
    end

    def new_shipping_profile(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'chris@bluecoastsavings.com', 'info@shipstoresoftware.com'],
             subject: 'New Shipping Profile Submitted')
    end

    def new_shipping_attachment(attachment)
        @prospect_attachment = attachment
        mail(to: [attachment.prospect.user_email, 'chris@bluecoastsavings.com', 'info@shipstoresoftware.com'],
             subject: 'New File Uploaded')
    end

    def shipping_lead_status_update(prospect)
        @prospect = prospect
        mail(from: "ShipStore <noreply@bluecoastcrm.com>",
             to: [prospect.user_email, 'chris@bluecoastsavings.com', 'info@shipstoresoftware.com'],
             subject: 'Shipping Lead Status Updated')
    end


    def new_branch_lead(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'chris@bluecoastsavings.com'],
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
             subject: 'New Lead Scheduled by IntelaTek')
    end

    def new_hcs_meeting(prospect)
        @prospect = prospect
        mail(from: "#{prospect.intelatek_bda} <info@healthcaresavings.co>",
              to: prospect.contact1_email, bcc: prospect.user_email, subject: 'health benefit savings')
    end

    def new_vcp_meeting(prospect)
        @prospect = prospect
        mail(from: "#{prospect.intelatek_bda} <ap@accounts-payable.co>",
              to: prospect.contact1_email, bcc: prospect.user_email, subject: 'accounts payable')
    end

    def new_pay_meeting(prospect)
        @prospect = prospect
        mail(from: "#{prospect.intelatek_bda} <info@savingsconsultants.co>",
              to: prospect.contact1_email, bcc: prospect.user_email, subject: 'same day pay')
    end

    def new_comment(comment)
        @comment = comment
        mail(to: [comment.prospect.user_email],
             subject: 'New Comment Submitted')
    end
end