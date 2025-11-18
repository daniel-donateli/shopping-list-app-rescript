## Docker

### Build da imagem

```sh
docker build -t shopping-list-app .
```

### Executar o container

```sh
docker run -p 8080:80 shopping-list-app
```

A aplicação estará disponível em `http://localhost:8080`

### Build e execução em um comando

```sh
docker build -t shopping-list-app . && docker run -p 8080:80 shopping-list-app
```
