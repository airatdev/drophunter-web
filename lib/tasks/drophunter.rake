namespace :drophunter do
  task fetch_random_files: :environment do
    Drophunter::Worker.new.random_strategy do |id|
      SaveDroplrFileJob.perform_now(id)
    end
  end
end
