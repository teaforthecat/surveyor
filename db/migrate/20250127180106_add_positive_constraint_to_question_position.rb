class AddPositiveConstraintToQuestionPosition < ActiveRecord::Migration[8.0]
  def up
    execute "ALTER TABLE questions ADD CONSTRAINT position CHECK (position > 0)"
  end

  def down
    execute "ALTER TABLE questions DROP CONSTRAINT position "
  end
end
