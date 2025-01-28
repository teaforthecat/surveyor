ActiveAdmin.register User do

 permit_params :email, #, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
               assignments_attributes: [:id, :survey_id, :_destroy]


 form do |f|
   f.input :email
   f.inputs do
     f.input :assignments, as: :check_boxes, collection: Survey.all.map{ |s| Assignment.new(survey_id: s.id) }
   end
   actions
 end

end
