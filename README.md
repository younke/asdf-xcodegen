<div align="center">

# asdf-xcodegen ![Build](https://github.com/younke/asdf-xcodegen/workflows/Build/badge.svg) ![Lint](https://github.com/younke/asdf-xcodegen/workflows/Lint/badge.svg)

[xcodegen](https://github.com/yonaskolb/XcodeGen) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add xcodegen
# or
asdf plugin add https://github.com/younke/asdf-xcodegen.git
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

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/younke/asdf-xcodegen/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Vasily Ptitsyn](https://github.com/younke/)
