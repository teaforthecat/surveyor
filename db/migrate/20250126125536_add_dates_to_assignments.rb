class AddDatesToAssignments < ActiveRecord::Migration[8.0]
  def change
    add_column :assignments, :assigned_at, :datetime
    add_column :assignments, :completed_at, :datetime
    add_column :assignments, :deadline_at, :datetime
  end
end
