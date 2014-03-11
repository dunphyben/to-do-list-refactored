require 'rspec'
require 'to_do'
require 'list_class'

describe 'List' do
  before do
    List.clear
  end

  it 'is initialized with a place to add tasks' do
    test_list = List.new('grocery list')
    test_list.should be_an_instance_of List
  end

  describe '.all' do
    it 'is empty at first' do
      List.all.should eq []
    end

    it 'saves the list into the array' do
      test_list = List.new('grocery list')
      test_list.saved_list
      List.all.should eq [test_list]
    end
  end

  describe '.clear' do
    it 'clears all of the saved lists from the array' do
      List.new('grocery list').saved_list
      List.clear
      List.all.should eq []
    end
  end

  describe '.create' do
    it 'creates a new instance of list' do
      test_list = List.create('grocery list')
      test_list.should be_an_instance_of List
    end

    it 'saves the new list' do
      test_list = List.create('chores')
      List.all.should eq [test_list]
    end
  end


  # describe '#add_task' do
  #   it 'adds a task to the current list' do
  #     test_list = List.new('games')
  #     task_to_add = Task.new('monkee bizness')
  #     test_list.add_task(task_to_add)
  #     test_list.tasks.should eq [task_to_add]
  #   end
  # end
end

