# go-docker-stater

## To run locally
Run the following command, which will start web server on port 8081
```
go run main.go
```

Testing with curl
```
▶ curl http://localhost:8081/hi
hi%

▶ curl http://localhost:8081/Sample
Hello, "Sample"%
```

## To Run using docker
Build docker image
```
docker build -t go-docker-stater .
```

Run using docker image, this will open the server on the port 8080
```
docker run -p 8080:8081 -it go-docker-stater
```
Testing using curl
```
▶ curl http://localhost:8080/hi
hi%

▶ curl http://localhost:8080/Sample
Hello, "Sample"%

