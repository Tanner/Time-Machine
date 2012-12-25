require 'trollop'

opts = Trollop::options do
    opt :dir, "Git Directory", :type => :string
    opt :file, "File", :type => :string
    opt :save_dir, "Directory where to save images", :type => :string
end

Trollop::die :dir, "must be given" if !opts[:dir]
Trollop::die :file, "must be given" if !opts[:file]
Trollop::die :save_dir, "must be given" if !opts[:save_dir]

Trollop::die :dir, "must exist" unless File.exist?(opts[:dir])
Trollop::die :save_dir, "must exist" unless File.exist?(opts[:save_dir])

file = opts[:file];

inital_dir = Dir.pwd.sub(' ', '\ ');

Dir.chdir(opts[:dir]) do
    # Record the current branch so we can get back to it in the end
    inital_branch = %x(git rev-parse --abbrev-ref HEAD).strip

    # Get hashes of all the commits
    hashes = %x(git log --format=format:%H).split(/\n/).reverse;

    hashes.each_with_index { |hash, index|
        system "git branch time-machine #{hash}"
        system "git checkout time-machine"

        result = system "phantomjs #{inital_dir}/picture.js #{file} #{opts[:save_dir]}#{index}.png"

        system "git checkout #{inital_branch}"
        system "git branch -d time-machine"

        if !result
            exit(-1);
        end
    }
end