# nagios: type/provider for nagios files for Puppet

[![License](https://img.shields.io/github/license/voxpupuli/puppet-augeasproviders_nagios.svg)](https://github.com/voxpupuli/puppet-augeasproviders_nagios/blob/master/LICENSE)
[![Puppet Forge Version](http://img.shields.io/puppetforge/v/puppet/augeasproviders_nagios.svg)](https://forge.puppetlabs.com/puppet/augeasproviders_nagios)
[![Puppet Forge Downloads](http://img.shields.io/puppetforge/dt/puppet/augeasproviders_nagios.svg)](https://forge.puppetlabs.com/puppet/augeasproviders_nagios)
[![Build Status](https://github.com/voxpupuli/puppet-augeasproviders_nagios/workflows/CI/badge.svg)](https://github.com/voxpupuli/puppet-augeasproviders_nagios/actions?query=workflow%3ACI)
[![Donated by Herculesteam](https://img.shields.io/badge/donated%20by-herculesteam-fb7047.svg)](#transfer-notice)

# Features

This module provides a new type/provider for Puppet to read and modify nagios
config files using the Augeas configuration library.

The advantage of using Augeas over the default Puppet `parsedfile`
implementations is that Augeas will go to great lengths to preserve file
formatting and comments, while also failing safely when needed.

This provider will hide *all* of the Augeas commands etc., you don't need to
know anything about Augeas to make use of it.

## Requirements

Augeas and the ruby-augeas bindings are required. Both are bundled in the
OpenVox and Puppet agent packages.

## Installing

    puppet module install puppet/augeasproviders_nagios

## Documentation and examples

Type documentation is in [REFERENCE.md](REFERENCE.md) and on the
[Puppet Forge page](https://forge.puppet.com/modules/puppet/augeasproviders_nagios).


### manage entry

    nrpe_command { "check_spec_test":
      ensure  => present,
      command => "/usr/bin/check_my_thing -p 'some command with \"multiple [types]\" of quotes' -x and-stuff",
    }

### delete entry

    nrpe_command { "check_test":
      ensure => absent,
    }

## Issues

Please file any issues or suggestions [on GitHub](https://github.com/voxpupuli/augeasproviders_nagios/issues).

## Supported OS

See [metadata.json](metadata.json) for supported OS versions.

## Dependencies

See [metadata.json](metadata.json) for dependencies.

## Puppet

The supported Puppet versions are listed in the [metadata.json](metadata.json)

## REFERENCES

Please see [REFERENCE.md](https://github.com/voxpupuli/puppet-augeasproviders_nagios/blob/master/REFERENCE.md) for more details.

## Contributing

Please report bugs and feature request using [GitHub issue
tracker](https://github.com/voxpupuli/puppet-augeasproviders_nagios/issues).

For pull requests, it is very much appreciated to check your Puppet manifest
with [puppet-lint](https://github.com/puppetlabs/puppet-lint/) to follow the recommended Puppet style guidelines from the
[Puppet Labs style guide](https://www.puppet.com/docs/puppet/latest/style_guide.html).

## Transfer Notice

This plugin was originally authored by [Hercules Team](https://github.com/hercules-team).
The maintainer preferred that Puppet Community take ownership of the module for future improvement and maintenance.
Existing pull requests and issues were transferred over, please fork and continue to contribute here instead of Hercules Team.
