class NotificationMailer < ApplicationMailer
    def new_hcsq(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'csharp@tridentbenefits.net', 'mvela@tridentbenefits.net'],
             subject: 'New HealthCare Prospect Submitted')
    end


    def new_shipping_profile(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'info@shipstoresoftware.com'],
             subject: 'New Shipping Profile Submitted')
    end


    def shipping_lead_status_update(prospect)
        @prospect = prospect
        mail(from: "ShipStore <noreply@bluecoastcrm.com>",
             to: [prospect.user_email, 'info@shipstoresoftware.com'],
             subject: 'Shipping Lead Status Updated')
    end


    def new_branch_lead(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'chris@bluecoastsavings.com'],
             subject: 'New Lead Submitted to Branch')
    end


    def new_pay(prospect)
        @prospect = prospect
        mail(to: [prospect.user_email, 'chris@bluecoastsavings.com'],
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
      if comment.shipping_content? && (comment.prospect.user_email != comment.user.email)
        mail(to: [comment.prospect.user_email, comment.user.email, 'info@shipstoresoftware.com'], subject: 'New Comment Added to Shipping Prospect')
      elsif comment.shipping_content?
        mail(to: [comment.prospect.user_email, 'info@shipstoresoftware.com'], subject: 'New Comment Added to Shipping Prospect')
      elsif comment.hcs_content? && (comment.prospect.user_email != (comment.user.email || 'csharp@tridentbenefits.net' || 'mvela@tridentbenefits.net'))
        mail(to: [comment.prospect.user_email, comment.user.email, 'csharp@tridentbenefits.net', 'mvela@tridentbenefits.net'], subject: 'New Comment Added to HealthCare Prospect')
      elsif comment.hcs_content?
        mail(to: [comment.prospect.user_email, 'csharp@tridentbenefits.net', 'mvela@tridentbenefits.net'], subject: 'New Comment Added to HealthCare Prospect')
      elsif comment.prospect.user_email != comment.user.email
        mail(to: [comment.prospect.user_email, comment.user.email], subject: 'New Comment Added to Prospect')
      else
        mail(to: [comment.prospect.user_email], subject: 'New Comment Added to Prospect')          
      end
    end


    def new_attachment(attachment)
      @prospect_attachment = attachment
      if (attachment.service_type == 'shipping') && (attachment.prospect.user_email != attachment.user.email)
        mail(to: [attachment.prospect.user_email, attachment.user.email, 'info@shipstoresoftware.com'], subject: 'New Shipping File Uploaded')
      elsif (attachment.service_type == 'shipping')
        mail(to: [attachment.prospect.user_email, 'info@shipstoresoftware.com'], subject: 'New Shipping File Uploaded')
      elsif (attachment.service_type == 'healthcare') && (attachment.prospect.user_email != (attachment.user.email || 'csharp@tridentbenefits.net' || 'mvela@tridentbenefits.net'))
        mail(to: [attachment.prospect.user_email, attachment.user.email, 'csharp@tridentbenefits.net', 'mvela@tridentbenefits.net'], subject: 'New Healthcare File Uploaded')
      elsif (attachment.service_type == 'healthcare')
        mail(to: [attachment.prospect.user_email, 'csharp@tridentbenefits.net', 'mvela@tridentbenefits.net'], subject: 'New Healthcare File Uploaded')
      elsif attachment.prospect.user_email != attachment.user.email
        mail(to: [attachment.prospect.user_email, attachment.user.email], subject: 'New File Uploaded')
      else
        mail(to: [attachment.prospect.user_email], subject: 'New File Uploaded')          
      end
    end

    
end