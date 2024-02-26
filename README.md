# Nix-centric project to check OGC compliance for QGIS

Set up your environment:

```
nix-shell
```


Run the server

```
docker-compose up
```

QGIS WMS Connection URI (for interactive verification with QGIS WMS Client:
```
http://localhost:8080/ogc/teamengine_wms_130
```

Run the tests:

This will run the server, run the tests then shut down the server.

```
./run-tests.sh
```




See https://docs.qgis.org/3.28/en/docs/developers_guide/ogcconformancetesting.html

Tim Sutton
Feb 2024
