ActiveAdmin.register Survey do

  permit_params :name,
                question_attributes: [:id, :content, :position, :_destroy]

  # form do |f|
  #   f.inputs :name
  #   f.inputs "Questions" do
  #     f.has_many :questions, sortable: :position do |ff|
  #       ff.input :content
  #     end
  #   end
  # end
end
