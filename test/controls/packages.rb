control 'ruby' do
  title 'ruby is installed'
  describe command('ruby --version') do
    its('stdout') { should match (/ruby 2\.6/) }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end

control 'rails' do
  title 'rails is installed'
  describe command('rails --version') do
    its('stdout') { should match (/Rails 6.0/) }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end

control 'bundler' do
  title 'bundler is installed'
  describe command('bundle --version') do
    its('stdout') { should match (/Bundler version 2\.0/) }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end

