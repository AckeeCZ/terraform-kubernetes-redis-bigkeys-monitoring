{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      },
      {
        "datasource": {
          "type": "stackdriver",
          "uid": "gcm"
        },
        "enable": true,
        "iconColor": "dark-blue",
        "name": "Deployments",
        "target": {
          "metricQuery": {
            "alignmentPeriod": "grafana-auto",
            "crossSeriesReducer": "REDUCE_NONE",
            "editorMode": "visual",
            "filters": [],
            "groupBys": [
              "metric.label.project_branch",
              "metric.label.project"
            ],
            "labels": {},
            "metricKind": "GAUGE",
            "metricType": "custom.googleapis.com/ci/deployment",
            "perSeriesAligner": "ALIGN_MEAN",
            "preprocessor": "none",
            "projects": [],
            "query": "",
            "refId": "annotationQuery",
            "text": "Branch <b>{{metric.label.project_branch}}</b> of project <b>{{metric.label.project}}</b> was deployed",
            "title": "DEPLOYMENT",
            "valueType": "INT64",
            "variableOptionGroup": {},
            "variableOptions": []
          },
          "refId": "Anno"
        }
      }
    ]
  },
  "editable": false,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 1,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "stackdriver",
        "uid": "gcm"
      },
      "description": "",
      "fill": 0,
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
        "alignAsTable": true,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": true,
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
      "pluginVersion": "9.1.6",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "datasource": {
            "type": "stackdriver",
            "uid": "gcm"
          },
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
      "timeRegions": [],
      "title": "Biggest Type",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "datasource": {
        "type": "stackdriver",
        "uid": "gcm"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "graph": false,
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
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
          "displayMode": "table",
          "placement": "right",
          "showLegend": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "7.5.4",
      "targets": [
        {
          "datasource": {
            "type": "stackdriver",
            "uid": "gcm"
          },
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
      "datasource": {
        "type": "stackdriver",
        "uid": "gcm"
      },
      "description": "",
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
      "pluginVersion": "9.1.6",
      "targets": [
        {
          "datasource": {
            "type": "stackdriver",
            "uid": "gcm"
          },
          "metricQuery": {},
          "queryType": "metrics",
          "refId": "A"
        }
      ],
      "title": "Description",
      "type": "text"
    }
  ],
  "schemaVersion": 37,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "current": {
          "selected": false,
          "text": "flash-news-production",
          "value": "flash-news-production"
        },
        "definition": "",
        "hide": 2,
        "includeAll": false,
        "multi": false,
        "name": "project_id",
        "options": [],
        "query": {
          "labelKey": "",
          "loading": false,
          "projects": [
            {
              "label": "flash-news-production",
              "value": "flash-news-production"
            }
          ],
          "refId": "CloudMonitoringVariableQueryEditor-VariableQuery",
          "selectedMetricType": "actions.googleapis.com/smarthome_action/execution_success_confidence",
          "selectedQueryType": "projects",
          "selectedSLOService": "",
          "selectedService": "actions.googleapis.com",
          "sloServices": [
            {
              "label": "papillon",
              "value": "NgR10BrzQm6YGZfAiGlqxw"
            },
            {
              "label": "flash-news-web",
              "value": "vW_CeLrKQZGBqbGrt9rlzg"
            }
          ]
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "type": "query"
      },
      {
        "current": {
          "selected": false,
          "text": "10.74.108.180",
          "value": "10.74.108.180"
        },
        "datasource": {
          "type": "stackdriver",
          "uid": "gcm"
        },
        "definition": "",
        "hide": 0,
        "includeAll": false,
        "label": "Redis Hosts",
        "multi": false,
        "name": "redis_host",
        "options": [],
        "query": {
          "labelKey": "metric.label.host",
          "loading": false,
          "projectName": "$project_id",
          "projects": [
            {
              "label": "flash-news-production",
              "value": "flash-news-production"
            }
          ],
          "refId": "CloudMonitoringVariableQueryEditor-VariableQuery",
          "selectedMetricType": "custom.googleapis.com/redis/bigkeys/avg",
          "selectedQueryType": "labelValues",
          "selectedSLOService": "",
          "selectedService": "custom.googleapis.com",
          "sloServices": [
            {
              "label": "papillon",
              "value": "NgR10BrzQm6YGZfAiGlqxw"
            },
            {
              "label": "flash-news-web",
              "value": "vW_CeLrKQZGBqbGrt9rlzg"
            }
          ]
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "current": {
          "selected": false,
          "text": "5",
          "value": "5"
        },
        "datasource": {
          "type": "stackdriver",
          "uid": "gcm"
        },
        "definition": "",
        "hide": 0,
        "includeAll": true,
        "label": "Redis Database",
        "multi": false,
        "name": "redis_database",
        "options": [],
        "query": {
          "labelKey": "metric.label.database",
          "loading": false,
          "projectName": "$project_id",
          "projects": [
            {
              "label": "flash-news-production",
              "value": "flash-news-production"
            }
          ],
          "refId": "CloudMonitoringVariableQueryEditor-VariableQuery",
          "selectedMetricType": "custom.googleapis.com/redis/bigkeys/avg",
          "selectedQueryType": "labelValues",
          "selectedSLOService": "",
          "selectedService": "custom.googleapis.com",
          "sloServices": [
            {
              "label": "papillon",
              "value": "NgR10BrzQm6YGZfAiGlqxw"
            },
            {
              "label": "flash-news-web",
              "value": "vW_CeLrKQZGBqbGrt9rlzg"
            }
          ]
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-3h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Redis Bigkeys",
  "uid": "S_EOtRS7z",
  "version": 1,
  "weekStart": ""
}
