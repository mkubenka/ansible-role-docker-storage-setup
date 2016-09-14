# Ansible Role docker-storage-setup [![Build Status](https://travis-ci.org/mkubenka/ansible-role-docker-storage-setup.svg?branch=master)](https://travis-ci.org/mkubenka/ansible-role-docker-storage-setup)

A simple service to config docker storage.

> https://github.com/projectatomic/docker-storage-setup
> https://docs.docker.com/engine/userguide/storagedriver/device-mapper-driver/

## Requirements

* `docker` you can use the [mkubenka.docker](https://github.com/mkubenka/ansible-role-docker) role to install.

## Role Variables

The variables that can be passed to this role and a brief description about
them are as follows. (For all variables, take a look at [defaults/main.yml](defaults/main.yml))

```yaml

# REQUIRED - List of devices to be used.
docker_storage_setup_devs: []

# The volume group to use for docker storage.
docker_storage_setup_vg_name: 'docker'

```

## Dependencies

None

## Example Playbook

    - hosts: servers
      vars:
        docker_storage_setup_devs:
          - /dev/xvdh
        docker_daemon_options:
          storage-driver: devicemapper
          storage-opts:
            - dm.fs=xfs
            - dm.thinpooldev=/dev/mapper/{{ docker_storage_setup_vg_name }}-docker--pool
            - dm.use_deferred_removal=true
            - dm.use_deferred_deletion=true      
      roles:
         - { role: mkubenka.docker-storage-setup }
         - { role: mkubenka.docker }

## TODO

* [ ] maybe there is a way how to test this role fully on travis

## License

BSD

## Author Information

Michal Kubenka <mkubenka@gmail.com>
