class Task

  @@all_tasks = [] #stores all the tasks

  def Task.all
    @@all_tasks
  end

  def Task.clear
    @@all_tasks = []
  end

  def Task.create(description)
    new_task = Task.new(description)
    new_task.save
    new_task
  end

  def save
    @@all_tasks << self
  end

  def initialize(description)
    @description = description
  end

  def description
    @description
  end

  def marked_done
    @marked_done = true
  end
end
