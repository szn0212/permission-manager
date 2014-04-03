# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :task do
    id '1'
    content 'Task A.'
    account
  end
end
