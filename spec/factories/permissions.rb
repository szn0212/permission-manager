# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :permission do
    sequence :id do |n|
      n
    end
    action 'manage'
    subject 'Task'
    description '管理任务'
  end
end
