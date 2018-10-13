class BchqMailer < ApplicationMailer
    def new_bchq(prospect)
        @prospect = prospect
        mail(to: 'chris@intelatek.com',
             subject: 'New BCHQ Submitted')
    end
end