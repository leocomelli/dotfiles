op item get main --vault dev --format json | jq -r '.fields | map(select(has("value"))) | map("set -gx " + .label + " \"" + .value + "\"") | join("\n")'
