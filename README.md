## robotfr
Dockerize Robot framework

### How to use
Create repository in your workspace, & put your test (`*.robot`) on `/tests` (you can pick this example : [chrome.robot](https://github.com/ykaaouachi/robotfr/tree/master/tests)).

```
$ # Get docker images
$ docker pull ykaaouachi/robotfr

$ mkdir path/to/your/workspace/project-name
$ cd path/to/your/workspace/project-name

$ # Create .robot files & add your test scripts
$ # See our example above 'chrome.robot'
$ mkdir tests && touch ./tests/your-test.robot

$ # Create output repo to get logs
$ mkdir out

$ # Run your container ;)
$ docker run -it --rm \
             --name test-with-robot \
             -v $(pwd)/tests:/tests:ro \
             -v $(pwd)/out:/out:rw 
             ykaaouachi/robotfr 

/ # pybot --outputdir /out /tests
==============================================================================
Tests
==============================================================================
Tests.Chrome :: A basic test to check google page with chrome
==============================================================================
User can open page :: As a user I can open the google page            | PASS |
------------------------------------------------------------------------------
User fill in the Search text box :: The user search 'Test with robot' | PASS |
------------------------------------------------------------------------------
Tests.Chrome :: A basic test to check google page with chrome         | PASS |
2 critical tests, 2 passed, 0 failed
2 tests total, 2 passed, 0 failed
==============================================================================
Tests                                                                 | PASS |
2 critical tests, 2 passed, 0 failed
2 tests total, 2 passed, 0 failed
==============================================================================
Output:  /out/output.xml
Log:     /out/log.html
Report:  /out/report.html
/ #              
```

To run your tests without enter container, replace this line in `entry_point.sh` : 
```
/bin/sh
```
by : 
```
pybot "$@"
```

When running container, add `--output /out /tests`, then : 
```
$ docker run -it --rm \
             --name test-with-robot \
             -v $(pwd)/tests:/tests:ro \
             -v $(pwd)/out:/out:rw
             ykaaouachi/robotfr
             --output /out /tests
```

### TODO : 
- Fix issue with firefox 
