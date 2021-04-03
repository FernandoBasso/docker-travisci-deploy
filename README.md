# Docker React Development and CI

* [Run Tests](#run-tests)
* [AWS Deploy vs Named Build Step](#aws-deploy-vs-named-build-step)

## Run Tests

Build the image and then run the image as a container, overriding the default command:

```
$ docker build -f Dockerfile.dev .
... output ...

$ docker run --interactive --tty 3db010dc1bc2 npm run test
```

And now we get a prompt like if Jest on hour host machine, responding to all its nice TUI commands.

Remember that `--interactive --tty` can be achieved with the shorter options `-it`. 😄

Alternatively, do something like this:

```
$ docker-compose up --build --detach
$ docker ps
$ docker exec -it dev1 npm run test
```

## AWS Deploy vs Named Build Step

- [See this note on the course](https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/learn/lecture/22538182#questions)


