require 'rspec'
require 'to_do'
require "list_class"

describe 'Task' do
  before do
    Task.clear
  end

  it 'is initialized with a description' do
    test_task = Task.new 'this is a task description'
    test_task.should be_an_instance_of Task
  end

  describe '#description' do
    it 'lets you read the description out' do
      test_task = Task.new('scrub the zebra')
      test_task.description.should eq 'scrub the zebra'
    end
  end

  describe '.all' do
    it 'is empty at first' do
      Task.all.should eq []
    end

    it 'gets added to when save is called on an instance' do
      test_task = Task.new('scrub the zebra')
      test_task.save
      Task.all.should eq [test_task]
    end
  end

  describe '.clear' do
    it 'empties out all the saved tasks' do
      Task.new('scrub the zebra').save
      Task.clear
      Task.all.should eq []
    end
  end

  describe '.create' do
    it 'makes a new instance of Task' do
      test_task = Task.create('wash a lion')
      test_task.should be_an_instance_of Task
    end

    it 'saves the task' do
      test_task = Task.create('wash the lion')
      Task.all.should eq [test_task]
    end
  end



  describe '#marked_done' do
    it 'marks a task as complete and removes the task from the list' do
      test_task = Task.new('kick a donkey')
      test_task.marked_done.should eq true
    end
  end
end

