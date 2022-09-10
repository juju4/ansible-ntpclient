# NTP Client ansible role

A simple ansible role to setup system with ntp synchronzation

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Tested on Ubuntu 18.04, 20.04 and 22.04.

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.ntpclient
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
BUT it will NOT work in containers as adjtime needs privileged (kernel) access which is not available in default configuration.

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/juju4.ntpclient
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/juju4.ntpclient/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* travis: idempotence fails on centos6 only for unknown reason
(task: enable and start ntp service)
* role will not execute inside lxc as kernel is shared and ntp adjtime is not permitted
http://blog.oddbit.com/2015/10/09/running-ntp-in-a-container/


## License

BSD 2-clause
