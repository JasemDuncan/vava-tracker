class GroupMailer < ApplicationMailer
    def new_group(group)
        @group=group
        User.all.each do |user|    
            mail(to: user.email, subject:"neww...")
        end
    end
end
