provides 'scalr'
scalr Mash.new
section = nil

File.foreach '/etc/scalr/private.d/config.ini' do |line|
  if line =~ /^\[([^\]]+)\]$/
    section = $1
    scalr[section] = {}
  else
    key, value = line.split(/\s*=\s*/)
    if section.nil?
      scalr[key] = value.chomp!
    else
      scalr[section][key] = value.chomp!
    end
  end
end
