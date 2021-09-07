{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "id": 30,
  "iteration": 1630935810418,
  "links": [],
  "panels": [
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {},
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 0,
        "y": 0
      },
      "hiddenSeries": false,
      "id": 2,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.5.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "metricQuery": {
            "aliasBy": "{{ metric.label.name }} {{ metric.label.type }}",
            "alignmentPeriod": "cloud-monitoring-auto",
            "crossSeriesReducer": "REDUCE_NONE",
            "editorMode": "visual",
            "filters": [
              "metric.label.host",
              "=",
              "$redis_host",
              "AND",
              "metric.label.database",
              "=",
              "$redis_database"
            ],
            "groupBys": [
              "metric.label.name",
              "metric.label.type"
            ],
            "metricKind": "GAUGE",
            "metricType": "custom.googleapis.com/redis/bigkeys/biggest",
            "perSeriesAligner": "ALIGN_MEAN",
            "query": "",
            "unit": "",
            "valueType": "DOUBLE"
          },
          "queryType": "metrics",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Biggest Type",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "graph": false,
              "legend": false,
              "tooltip": false
            },
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "decbytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 0
      },
      "id": 6,
      "options": {
        "graph": {},
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltipOptions": {
          "mode": "single"
        }
      },
      "pluginVersion": "7.5.4",
      "targets": [
        {
          "metricQuery": {
            "aliasBy": "{{ metric.label.type }}",
            "alignmentPeriod": "cloud-monitoring-auto",
            "crossSeriesReducer": "REDUCE_MEAN",
            "editorMode": "visual",
            "filters": [
              "metric.label.host",
              "=",
              "$redis_host",
              "AND",
              "metric.label.database",
              "=",
              "$redis_database"
            ],
            "groupBys": [
              "metric.label.type"
            ],
            "metricKind": "GAUGE",
            "metricType": "custom.googleapis.com/redis/bigkeys/avg",
            "perSeriesAligner": "ALIGN_MEAN",
            "query": "",
            "unit": "",
            "valueType": "DOUBLE"
          },
          "queryType": "metrics",
          "refId": "A"
        }
      ],
      "title": "Avg Size",
      "type": "timeseries"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {},
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 9
      },
      "id": 8,
      "options": {
        "content": "# Logs\n\nLogs could be located in Stackdriver monitoring:\n  * [`Average` log lines](https://console.cloud.google.com/logs/query;query=resource.labels.container_name%3D%22redis-bigkeys-monitoring%22%0AjsonPayload.type%3D%22avg%22;timeRange=P3D?project=${project_id})\n  * [`Biggest` log lines](https://console.cloud.google.com/logs/query;query=resource.labels.container_name%3D%22redis-bigkeys-monitoring%22%0AjsonPayload.type%3D%22biggest%22;timeRange=P3D?project=${project_id})",
        "mode": "markdown"
      },
      "pluginVersion": "7.5.4",
      "targets": [
        {
          "metricQuery": {},
          "queryType": "metrics",
          "refId": "A"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Description",
      "type": "text"
    }
  ],
  "schemaVersion": 27,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "allValue": null,
        "current": {
          "selected": true,
          "text": "10.12.237.227",
          "value": "10.12.237.227"
        },
        "datasource": null,
        "definition": "",
        "description": null,
        "error": null,
        "hide": 0,
        "includeAll": false,
        "label": "Redis Hosts",
        "multi": false,
        "name": "redis_host",
        "options": [],
        "query": {
          "labelKey": "metric.label.host",
          "loading": false,
          "projectName": "${project_id}",
          "projects": [
            {
              "label": "${project_id}",
              "value": "${project_id}"
            }
          ],
          "refId": "CloudMonitoringVariableQueryEditor-VariableQuery",
          "selectedMetricType": "custom.googleapis.com/redis/bigkeys/avg",
          "selectedQueryType": "labelValues",
          "selectedSLOService": "",
          "selectedService": "custom.googleapis.com",
          "sloServices": [
          ]
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {
          "selected": true,
          "text": "5",
          "value": "5"
        },
        "datasource": null,
        "definition": "",
        "description": null,
        "error": null,
        "hide": 0,
        "includeAll": false,
        "label": "Redis Database",
        "multi": false,
        "name": "redis_database",
        "options": [
          {
            "selected": true,
            "text": "5",
            "value": "5"
          }
        ],
        "query": {
          "labelKey": "metric.label.database",
          "loading": false,
          "projectName": "${project_id}",
          "projects": [
            {
              "label": "${project_id}",
              "value": "${project_id}"
            }
          ],
          "refId": "CloudMonitoringVariableQueryEditor-VariableQuery",
          "selectedMetricType": "custom.googleapis.com/redis/bigkeys/avg",
          "selectedQueryType": "labelValues",
          "selectedSLOService": "",
          "selectedService": "custom.googleapis.com",
          "sloServices": [
          ]
        },
        "refresh": 0,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Redis Bigkeys",
  "uid": "S_EOtRS7z",
  "version": 5
}
