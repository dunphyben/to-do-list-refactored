class List

  @@all_lists = []

  def List.all
    @@all_lists
  end

  def List.clear
    @@all_lists = []
  end

  def List.create(list_name)
    new_list = List.new(list_name)
    new_list.saved_list
    new_list
  end

  def saved_list
    @@all_lists << self
  end

  def initialize(list_name)
    @list_name = list_name
    @tasks = []
  end

  # def tasks
  #   @tasks
  # end

  # def add_task(task_to_add)
  #   @tasks << task_to_add
  # end
end
