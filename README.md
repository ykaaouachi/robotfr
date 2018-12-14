## robotfr
Dockerize Robot framework (lightweight `~200 MB`)

### How to use
Create repository in your workspace, & put your test (`*.robot`) on `/tests`.
You can pick this example : [chrome.robot](https://github.com/ykaaouachi/robotfr/blob/master/tests/chrome.robot)).

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
             -v $(pwd)/out:/out:rw \
             ykaaouachi/robotfr 

/ # pybot --outputdir /out /tests
```

![alt text](https://github.com/ykaaouachi/robotfr/blob/master/images/out-put.png)

### N.B.

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
             -v $(pwd)/out:/out:rw \
             ykaaouachi/robotfr \
             --output /out /tests
```

### TODO : 
- Fix issue with firefox
