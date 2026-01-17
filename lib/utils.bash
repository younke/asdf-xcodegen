#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/yonaskolb/XcodeGen"
TOOL_NAME="xcodegen"
TOOL_TEST="xcodegen --help"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

get_platform() {
	local kernel
	kernel="$(uname -s)"

	case "$kernel" in
	Darwin)
		echo "macos"
		;;
	*)
		fail "Unsupported OS: $kernel. XcodeGen is macOS-only."
		;;
	esac
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	url="$GH_REPO/releases/download/${version}/xcodegen.zip"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_root="${3%/bin}"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_root"

		# Install the full extracted archive (xcodegen binary + bundled resources).
		# XcodeGen requires additional runtime resources (e.g. share/xcodegen / bundle).
		cp -R "${ASDF_DOWNLOAD_PATH}/." "$install_root/"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_root/bin/$tool_cmd" || fail "Expected $install_root/bin/$tool_cmd to be executable."
		test -d "$install_root/share/xcodegen" -o -d "$install_root/XcodeGen_XcodeGenKit.bundle" || fail "Expected XcodeGen bundled resources to be installed (share/xcodegen or XcodeGen_XcodeGenKit.bundle)."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_root"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
