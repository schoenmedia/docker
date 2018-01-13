# Docker setup for php development

* configure nginx
```bash
vim config/nginx/nginx.conf 
```

server_name **dev.yourhost.de**;


* configure php
```bash
vim config/php/Dockerfile 
```

ENV GITHUB_TOKEN **your_token**

* configure docker-compose 
```bash
vim docker-compose.yml
```

container_name: **name_your_container**
