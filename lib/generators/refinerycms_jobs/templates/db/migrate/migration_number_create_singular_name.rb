class CreateJobs < ActiveRecord::Migration

  def self.up
    create_table :jobs do |t|
      t.string      :job_title
      t.text        :description
      t.string      :employment_terms
      t.string      :hours
      t.integer     :position
      t.boolean     :enabled
      t.timestamps
    end

    add_index :jobs, :id

    load(Rails.root.join('db', 'seeds', 'refinerycms_jobs.rb').to_s)
  end

  def self.down
    UserPlugin.destroy_all({:title => "Jobs"})

    Page.find_all_by_link_url("/jobs").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/jobs"})

    drop_table :jobs
  end

end
