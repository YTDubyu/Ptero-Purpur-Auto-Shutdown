JAR="${SERVER_JARFILE:-server.jar}"

echo "Purpur Startup: $JAR"

if [ ! -s "$JAR" ]; then
  echo "âŒ server.jar missing or empty"
  exit 1
fi

if ! jar tf "$JAR" | grep -Eq "io/papermc/paperclip|org/purpurmc"; then
  echo "âŒ JAR does not appear to be a valid Purpur server"
  exit 1
fi

echo "âœ… Purpur jar verified (class check via jar)"
exec java -Xmx${SERVER_MEMORY}M -jar "$JAR" nogui
