#!/usr/bin/env bash

echo "💡 Running OGC test suite for QGIS."
echo "🕛️ Execution may take a little while....please be patient"
echo "🏃 Starting docker compose"
docker-compose up
echo "🚀 Launching test suite"
python pyogctest/pyogctest.py -s ogcapif -u http://localhost:8080/ogc/teamengine_wms_130
echo "🔫 Killing docker containers"
docker-compose kill
echo "🧹 Cleaning up"
docker-compose rm
echo "🏆️ Done!"
