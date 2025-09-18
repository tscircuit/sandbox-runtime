# Start a background HTTP server, that allows for querying different
# stuff within the container from the orchestrator
# /add_file
# /start (instead of running main thing directly)

echo "Running tsci build"

set -x

# MAIN THING
bunx tsci build
