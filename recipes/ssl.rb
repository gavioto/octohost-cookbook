# encoding: utf-8
#
# Cookbook Name:: octohost
# Recipe:: ssl
#
# Copyright (C) 2013, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Add key, cert and config file.
%w{/etc/hipache/ssl.key /etc/hipache/ssl.crt /etc/hipache/hipache.json}.each do |conf|
  cookbook_file conf do
    action :create
  end
end

# Restart hipache.
bash 'restart hipache' do
  cwd 'root'
  user 'root'
  code <<-EOF
    service hipache restart
  EOF
end
