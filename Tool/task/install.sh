if [[ ! -s "$HOME/.bash_profile" && -s "$HOME/.profile" ]] ; then
  profile_file="$HOME/.profile"
else
  profile_file="$HOME/.bash_profile"
fi

if ! grep -q 'Applications/calibre.app' "${profile_file}" ; then
  echo "export PATH=\"/Applications/calibre.app/Contents/MacOS/:\$PATH\"" >> "${profile_file}"
fi
