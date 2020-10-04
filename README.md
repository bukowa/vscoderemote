```
mkdir -p ~/.vscode
docker run -it -p X:8080 \
  --restart=always \
  -v "vscode:/home/coder" \
  -v "$PWD:/home/coder/project" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -u "$(id -u):$(id -g)" \
  --name=vsremote \
  vsremote
```