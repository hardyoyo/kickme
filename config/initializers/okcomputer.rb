if ENV["OKCOMPUTER_PASSWD"].present?
  OkComputer.require_authentication("status", ENV["OKCOMPUTER_PASSWD"])
end
