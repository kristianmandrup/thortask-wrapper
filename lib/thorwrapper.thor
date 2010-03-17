require 'fileutils'
require 'thor/group'

class Thorwrapper < Thor::Group
  include Thor::Actions

  # Define arguments and options
  argument :destination, :type => :string, :default => "#{ENV['HOME']}/binaries", :optional => true

  def self.source_root                   
    template_path(__FILE__) # tries ROOT/templates and then ROOT/lib/templates        
  end

  def execute     
    thor_root = File.join(ENV['HOME'], '.thor')
    thor_yml_file = File.join(thor_root, 'thor.yml')    
    say "Bash wrappes generated in #{destination}"        
    if File.exists?(thor_yml_file)
      yaml = YAML.load_file(thor_yml_file) 
      # Iterate each task
      yaml.each_pair do |task_name, task|
        # Generate bash file with name of task
        generate_bash_file(task_name, task)        
      end       
    end
  end   
     
protected
  def generate_bash_file(task_name, task)
    task_name = task_name.gsub /\.thor/, ''

    FileUtils.mkdir_p(destination) if !File.directory?(destination)
    bash_file_name = File.join(destination, "#{task_name}.sh")
    say "Generating bash file #{bash_file_name}"        
    File.open(bash_file_name, 'w') do |file|
      task.each_pair do |key, value|
        if 'namespaces' == key.to_s
          # For each namespace create bash wrapper
          value.each do |namespace|
            names = namespace.split(':')
            fun_name = names.join('_')
          	file.puts <<-EOS 
function #{fun_name} {
	thor #{namespace} $@
}          	
            EOS
          end            
        end
      end
    end
    # make scripts executable    
    `chmod +x #{bash_file_name}`
  end      
end
                  
