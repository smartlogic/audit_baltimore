rbenv_ruby "2.1.0" do
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.1.0"
end

package "postgresql-server-dev-9.1"
