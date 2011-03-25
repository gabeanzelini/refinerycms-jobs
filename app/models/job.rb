class Job < ActiveRecord::Base

  acts_as_indexed :fields => [:job_title, :description, :employment_terms, :hours],
                  :index_file => [Rails.root.to_s, "tmp", "index"]

  validates_presence_of :job_title, :description
  validates_uniqueness_of :job_title
end
