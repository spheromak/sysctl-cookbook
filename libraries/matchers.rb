if defined?(ChefSpec)
  def set_sysctl(sysctl)
    ChefSpec::Matchers::ResourceMatcher.new(:sysctl, :set, sysctl)
  end

  def write_sysctl(sysctl)
    ChefSpec::Matchers::ResourceMatcher.new(:sysctl, :set, sysctl)
  end
end
