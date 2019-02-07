desc 'add juice'
task add_juice: :environment do
    AccountsController.add_juice
end

desc 'add accrual'
task add_accrual: :environment do
  AccountsController.add_accrual
end
