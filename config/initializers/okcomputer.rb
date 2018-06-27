if ENV["OKCOMPUTER_PASSWD"].present?
  OkComputer.require_authentication("status", ENV["OKCOMPUTER_PASSWD"])
end

OkComputer::Registry.register "redis", OkComputer::RedisCheck.new
OkComputer::Registry.register "solr", OkComputer::SolrCheck.new
