revisions_logfile = "/opt/#{ENV['PROJECT_NAME']}/revisions.log"

GIT_SHA =
  if Rails.env.production? && File.exist?(revisions_logfile)
    `tail -1 #{revisions_logfile}`.chomp.split(" ")[3].gsub(/\)$/, '')
  elsif Rails.env.development? || Rails.env.test?
    `git rev-parse HEAD`.chomp
  else
    "Unknown SHA"
  end

BRANCH =
  if Rails.env.production? && File.exist?(revisions_logfile)
    `tail -1 #{revisions_logfile}`.chomp.split(" ")[1]
  elsif Rails.env.development? || Rails.env.test?
    `git rev-parse --abbrev-ref HEAD`.chomp
  else
    "Unknown branch"
  end

LAST_DEPLOYED = 
  if Rails.env.production? && File.exist?(revisions_logfile)
    deployed = `tail -1 #{revisions_logfile}`.chomp.split(" ")[7]
    Date.parse(deployed).strftime("%d %B %Y")
  else
    "Not in deployed environment"
  end

HYRAX_VERSION =
    if File.exist?('Gemfile.lock')
      version_match = `grep 'hyrax (' Gemfile.lock`
      version_match.present? ? version_match.lines.first.chomp.lstrip.split(/ /)[1].gsub('(','').gsub(')','') : "Unknown"
    else
      "Unknown"
    end

HYRAX_BRANCH =
    if File.exist?('Gemfile.lock')
      branch_match = `grep branch Gemfile.lock`
      branch_match.present? ? branch_match.lines.first.chomp.lstrip.split(/ /)[1] : nil
    else
      "Unknown"
    end

HYRAX_BRANCH_REVISION =
    if File.exist?('Gemfile.lock')
      revision_match = `grep revision Gemfile.lock`
      revision_match.present? ? revision_match.lines.first.chomp.lstrip.split(/ /)[1] : nil
    else
      "Unknown"
    end
