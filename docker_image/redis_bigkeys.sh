#!/bin/bash

DATABASE=${DATABASE:-5}
HOST=${HOST:-"localhost"}
SLEEP=${SLEEP:-"60"}
SKIP_ITERATIONS_FOR_STRING=${SKIP_ITERATIONS_FOR_STRING:-"10"}

gcm_write_metric() {
  local metric_type=$1
  local labels=$2
  local value=$3
  local value_type=$4
  local metric_kind=${5:-GAUGE}

  output=`curl -sS \
    -H "Authorization: Bearer $(gcloud auth application-default print-access-token)" \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json; charset=utf-8' \
    "https://monitoring.googleapis.com/v3/projects/${GCP_PROJECT_ID}/timeSeries" \
    -d "{
      \"timeSeries\": [
        {
          \"metric\": {
            \"type\":\"custom.googleapis.com/$metric_type\",
            \"labels\": $labels
          },
          \"resource\": {
            \"type\": \"global\",
            \"labels\": {
              \"project_id\":\"$GCP_PROJECT_ID\"
            }
          },
          \"metricKind\": \"$metric_kind\",
          \"points\": [
            {
              \"interval\": {
                \"endTime\":\"$(date -Iseconds)\"
              },
              \"value\": {
                \"$value_type\": $value
              }
            }
          ]
        }
      ]
    }"`

  if [[ $? -gt 0 ]]; then
    printf "%s" "$output"
  fi
}

print_jsonized_lines() {
  while read line; do
    jq -c -n --arg line "$line" --arg type "$2" \
     '{"line": $line, "type": $type}'
  done <<< $(printf "%s" "$1")
}

while true; do
  redis_output=`redis-cli -h "$HOST" --bigkeys -n $DATABASE`

  while read -r biggest_type biggest_name biggest_value; do
      labels=$(jq -n \
          --arg biggest_type "$biggest_type" \
          --arg biggest_name "$biggest_name" \
          --arg database "$DATABASE" \
          --arg host "$HOST" \
          '{"type": $biggest_type, "name": $biggest_name, "database": $database, "host": $host}')
      gcm_write_metric "redis/bigkeys/biggest" "$labels" "$biggest_value" doubleValue
  done <<< $(printf "%s" "$redis_output" | awk '/^Biggest.*found.*$/{name=substr($4,2,length($4)-2); printf("%s %s %s\n", $2, name, $(NF-1))}')

  biggest_lines=`printf "%s" "$redis_output" | grep '^Biggest.*found.*$'`
  print_jsonized_lines "$biggest_lines" "biggest"

  while read -r avg_count avg_type avg_value; do
      labels=$(jq -n \
          --arg avg_count "$avg_count" \
          --arg avg_type "$avg_type" \
          --arg database "$DATABASE" \
          --arg host "$HOST" \
          '{"count": $avg_count, "type": $avg_type, "database": $database, "host": $host}')
      gcm_write_metric "redis/bigkeys/avg" "$labels" "$avg_value" doubleValue
  done <<< $(printf "%s" "$redis_output" | awk '/^[0-9]* .* avg size [0-9\.]*\)$/{gsub("\)", "", $NF); printf("%s %s %s\n", $1, $2, $NF)}')

  avg_lines=`printf "%s" "$redis_output" | grep '^[0-9]* .* avg size [0-9\.]*)$'`
  print_jsonized_lines "$avg_lines" "avg"

  sleep $SLEEP
done
