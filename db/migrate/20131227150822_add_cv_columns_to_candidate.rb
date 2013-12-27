class AddCvColumnsToCandidate < ActiveRecord::Migration
  def self.up
    add_attachment :candidates, :cv_file
  end

  def self.down
    remove_attachment :candidates, :cv_file
  end

end
