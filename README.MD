Build docker container
```
docker build -t geocoder .
```

Run docker container Ubuntu
```
docker run --rm -it --network=host --env RABBITMQ_HOST=localhost --env RABBITMQ_USER=user_name --env RABBITMQ_PASSWORD=password geocoder
```

Run docker container macOS
```
docker run --rm -it --env RABBITMQ_HOST=host.docker.internal --env RABBITMQ_USER=user_name --env RABBITMQ_PASSWORD=password geocoder
```

export GitHub PKG variables
```
export DOCKER_USER=''
export DOCKER_PASSWORD=''
```

ansible deploy
```
ansible-playbook deploy/deploy.yml
```

view logs
```
docker logs -f geocoder
```