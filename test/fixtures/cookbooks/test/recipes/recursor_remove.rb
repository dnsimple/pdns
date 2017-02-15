def version_per_platform
  case node['platform']
  when 'debian'
    '4.0.3-1pdns.jessie'
  when 'ubuntu'
    "4.0.4-1pdns.#{node['lsb']['codename']}"
  when 'rhel'
    "4.0.4-1pdns.el#{node['centos-release']['version']}"
  end
end

pdns_recursor 'a_pdns_recursor' do
  action :remove
  version version_per_platform
end