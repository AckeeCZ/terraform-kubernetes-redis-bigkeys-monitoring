#!/bin/bash

database=${DATABASE:-5}
host=${HOST:-"localhost"}
sleep=${SLEEP:-"60"}

gcm_write_metric() {
  local metric_type=$1
  local labels=$2
  local value=$3
  local value_type=$4
  local metric_kind=${5:-GAUGE}

  curl -sS \
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
    }"
}


while true; do
  while read -r biggest_type biggest_name biggest_value; do
      labels=$(jq -n \
          --arg biggest_type "$biggest_type" \
          --arg biggest_name "$biggest_name" \
          --arg database "$database" \
          '{"type": $biggest_type, "name": $biggest_name, "database": $database}')
      gcm_write_metric "redis/bigkeys/biggest" "$labels" "$biggest_value" doubleValue
  done <<< $(redis-cli -h "$host" --bigkeys -n 5 | awk '/^Biggest/{name=substr($4,2,length($4)-2); printf("%s %s %s\n", $2, name, $(NF-1))}')


  while read -r avg_count avg_type avg_value; do
      labels=$(jq -n \
          --arg avg_count "$avg_count" \
          --arg avg_type "$avg_type" \
          --arg database "$database" \
          '{"count": $avg_count, "type": $avg_type, "database": $database}')
      gcm_write_metric "redis/bigkeys/avg" "$labels" "$avg_value" doubleValue
  done <<< $(redis-cli -h "$host" --bigkeys -n 5 | awk '/^[0-9]* .* avg size [0-9\.]*\)$/{gsub(")", "", $NF); printf("%s %s %s\n", $1, $2, $NF)}')
  
  sleep $SLEEP
done