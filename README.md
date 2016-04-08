[![Build Status](https://travis-ci.org/juju4/ansible-ntpclient.svg?branch=master)](https://travis-ci.org/juju4/ansible-ntpclient)
# NTP Client ansible role

A simple ansible role to setup system with ntp synchronzation

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - ntpclient
```

It will setup debian-based system with openntpd and redhat-based system with ntpd.

## Variables

```
## if not defined, will not listen
#ntpclient_listen: *
#ntpclient_listen: 127.0.0.1
## On Centos, it's recommended to enable at least those
#ntpclient_listen: [ 127.0.0.1, ::1 ]

## http://twiki.ntp.org/bin/view/Servers/NTPPoolServers
ntpclient_servers:
    - pool.ntp.org
#    - 0.debian.pool.ntp.org
#    - 1.debian.pool.ntp.org
#    - 2.debian.pool.ntp.org
#    - 3.debian.pool.ntp.org
#    - 0.centos.pool.ntp.org
```

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/ntpclient
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/ntpclient/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* travis: idempotence fails on centos6 only for unknown reason
(task: enable and start ntp service)

## License

BSD 2-clause

