require 'trollop'

opts = Trollop::options do
    opt :dir, "Git Directory", :type => :string
    opt :file, "File", :type => :string
end

Trollop::die :dir, "must be given" if !opts[:dir]
Trollop::die :file, "must be given" if !opts[:file]

Trollop::die :dir, "must exist" unless File.exist?(opts[:dir])

p opts