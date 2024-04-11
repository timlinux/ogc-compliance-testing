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

## Notes from Paul Blottiere

Dear PSC, hello Tim,


@Tim I talked with Régis today and he told me that you recently took a look at
TeamEngine for the QGIS Server OGC certification. FWIW, here is some
information about the current status of the certification process.


First, the QGIS-Server-CertifSuite [0] was created in 2018 to run the WMS
1.3.0 OGC testsuite every night on the master branch and reports were available
through the QGIS website. The aim was to detect regressions as soon as possible
as well as to provide some tools for the formal certification process. The WFS
1.1 was also supported, but the QGIS Server implementation never reached full
OGC compliance. Later in 2019, the OGC API Feature testsuite has also been added.


Then in 2020, the QEP [1] has been funded thanks to the Grant Programme. Since,
the WMS 1.3.0 testsuite is checked in QGIS CI thanks to the pyogctest tool [2]
in a dedicated Github Action [3]. In 2021, the QEP [4] has also been funded
thanks to the Grant Programme to add OGC API Feature testsuite in QGIS CI.


Everything is running smoothly since (I just have to do some maintenance from
time to time) and we don't have any regressions anymore :).  But now that OGC
testsuites are properly checked in QGIS CI, running the QGIS-Server-CertifSuite
every night was not really useful so it's not really maintained anymore.


If someone wants to run pyogctest manually, everything is documented in the
developers guide [5]. Indeed pyogctest can be used to run OGC testsuites in
command line (like pytest).


In 2022, the QGIS-Server-CertifSuite repo was updated for the 3.28 formal
certification process and the website was updated with the corresponding
badge [6].


From now on, 2 things probably need to be addressed:

- the 3.34 formal certification : I can take care of it, just let me know :)
- the OGC API Features testsuite needs to be upgraded in pyogctest because some
  tests have been added. In this case, some bugfixes are necessary on QGIS
  Server side. It's on my TODO list for 2024 :').


Let me know if I missed something or if I can help on these subjects.


Have a good day.

Regards.
Paul

[0] https://github.com/qgis/QGIS-Server-CertifSuite
[1] https://github.com/qgis/QGIS-Enhancement-Proposals/issues/175
[2] https://github.com/pblottiere/pyogctest
[3] https://github.com/qgis/QGIS/actions/workflows/ogc.yml
[4] https://github.com/qgis/QGIS-Enhancement-Proposals/issues/212
[5] https://docs.qgis.org/testing/en/docs/developers_guide/ogcconformancetesting.html
[6] https://www.qgis.org/fr/site/getinvolved/daily_reports/ogc.html



See https://docs.qgis.org/3.28/en/docs/developers_guide/ogcconformancetesting.html

Tim Sutton
Feb 2024
