describe command('docker info') do
  its('stdout') { should_not match /Usage of loopback devices is strongly discouraged for production use/ }
  its('exit_status') { should eq 0 }
end
