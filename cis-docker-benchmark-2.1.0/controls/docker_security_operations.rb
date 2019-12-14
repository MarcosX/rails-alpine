# encoding: utf-8
# frozen_string_literal: true

# Copyright 2016, Patrick Muench
# Copyright 2017, Christoph Hartmann
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
# author: Christoph Hartmann
# author: Dominik Richter
# author: Patrick Muench

title 'Docker Security Operations'

# check if docker exists
only_if do
  command('docker').exist?
end

control 'docker-6.1' do
  impact 1.0
  title 'Perform regular security audits of your host system and containers'
  desc 'Perform regular security audits of your host system and containers to identify any mis-configurations or vulnerabilities that could expose your system to compromise.

  Rationale: Performing regular and dedicated security audits of your host systems and containers could provide deep security insights that you might not know in your daily course of business. The identified security weaknesses should be then mitigated and this overall improves security posture of your environment.'

  tag 'docker'
  tag 'cis-docker-1.12.0': '6.1'
  tag 'cis-docker-1.13.0': '6.1'
  tag 'level:1'
  ref 'IT security auditing: Best practices for conducting audits', url: 'http://searchsecurity.techtarget.com/IT-security-auditing-Best-practices-for-conducting-audits'

  describe 'docker-test' do
    skip 'Perform regular security audits of your host system and containers'
  end
end

control 'docker-6.2' do
  impact 1.0
  title 'Monitor Docker containers usage, performance and metering'
  desc 'Containers might run services that are critical for your business. Monitoring their usage, performance and metering would be of paramount importance.

  Rationale: Tracking container usage, performance and having some sort of metering around them would be important as you embrace the containers to run critical services for your business. This would give you

      Capacity Management and Optimization
      Performance Management
      Comprehensive Visibility

  Such a deep visibility of container performance would help you ensure high availability of containers and minimum downtime.'

  tag 'docker'
  tag 'cis-docker-1.12.0': '6.2'
  tag 'cis-docker-1.13.0': '6.2'
  tag 'level:1'
  ref 'Runtime metrics', url: 'https://docs.docker.com/engine/admin/runmetrics/'
  ref 'cAdvisor (Container Advisor)', url: 'https://github.com/google/cadvisor'
  ref 'Use the Docker command line', url: 'https://docs.docker.com/engine/reference/commandline/cli/'

  describe 'docker-test' do
    skip 'Monitor Docker containers usage, performance and metering'
  end
end

control 'docker-6.3' do
  impact 1.0
  title 'Backup container data'
  desc 'Take regular backups of your container data volumes.

  Rationale: Containers might run services that are critical for your business. Taking regular data backups would ensure that if there is ever any loss of data you would still have your data in backup. The loss of data could be devastating for your business.'

  tag 'docker'
  tag 'cis-docker-1.12.0': '6.3'
  tag 'cis-docker-1.13.0': '6.3'
  tag 'level:1'
  ref 'Backups and disaster recovery', url: 'https://docs.docker.com/datacenter/ucp/2.2/guides/admin/backups-and-disaster-recovery/'
  ref 'How can I backup a Docker-container with its data-volumes?', url: 'https://stackoverflow.com/questions/26331651/how-can-i-backup-a-docker-container-with-its-data-volumes'
  ref 'Use the Docker command line', url: 'https://docs.docker.com/engine/reference/commandline/cli/'

  describe 'docker-test' do
    skip 'Backup container data'
  end
end
