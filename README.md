<div align="center">

# asdf-xcodegen

[![Build](https://github.com/younke/asdf-xcodegen/actions/workflows/build.yml/badge.svg)](https://github.com/younke/asdf-xcodegen/actions/workflows/build.yml)
[![Lint](https://github.com/younke/asdf-xcodegen/actions/workflows/lint.yml/badge.svg)](https://github.com/younke/asdf-xcodegen/actions/workflows/lint.yml)
[![Mise](https://github.com/younke/asdf-xcodegen/actions/workflows/test-mise.yml/badge.svg)](https://github.com/younke/asdf-xcodegen/actions/workflows/test-mise.yml)

[XcodeGen](https://github.com/yonaskolb/XcodeGen) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `unzip`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add xcodegen
# or
asdf plugin add xcodegen https://github.com/younke/asdf-xcodegen.git
```

xcodegen:

```shell
# Show all installable versions
asdf list-all xcodegen

# Install specific version
asdf install xcodegen latest

# Set a version globally (on your ~/.tool-versions file)
asdf global xcodegen latest

# Now xcodegen commands are available
xcodegen --help
```

:warning: Ensure that you have `SettingPresets` copy (related to particular `xcodegen` version) in your project directory before running the command.
Note that globally installed `xcodegen` keeps `SettingPresets` in `/usr/local/share/xcodegen` folder.
You might want to delete previous global installation (`brew` etc.).

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/younke/asdf-xcodegen/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Vasily Ptitsyn](https://github.com/younke/)
