# Copy iTerm2 profile data to special location for it to pickup
# https://stackoverflow.com/questions/22943676/how-to-export-iterm2-profiles#comment90184782_23356086

FILE="profiles.json"
DEST="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

echo "Copying iTerm2 profiles..."
if cp "./$FILE" "$DEST"
then
  echo "Done!"
else
  echo "Copy failure. Exit status: $?"
fi

