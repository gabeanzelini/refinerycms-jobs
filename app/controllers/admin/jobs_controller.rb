class Admin::JobsController < Admin::BaseController

  crudify :job, :title_attribute => :job_title

end
