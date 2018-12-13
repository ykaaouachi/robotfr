## robotfr
Dockerize Robot framework

### How to use
Create repository in your workspace, & put your test (`*.robot`) on `/tests` (you can pick this example : [chrome.robot](https://github.com/ykaaouachi/robotfr/tree/master/tests)).

```
$ docker run -it --rm \
              --name rfr2 \
              -v $(pwd)/tests:/tests:ro \
              -v $(pwd)/out:/out:rw 
              ykaaouachi/robotfr 
              --outputdir /out /tests
```

### TODO : 
- Fix issue with firefox 
