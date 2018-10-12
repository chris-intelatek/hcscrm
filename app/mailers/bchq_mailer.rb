class BchqMailer < ApplicationMailer
    def new_bchq(prospect)
        @prospect = prospect
        mail(to: 'fixed@example.com',
             subject: 'New BCHQ Submitted')
    end
end