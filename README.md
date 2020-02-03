# 基础镜像 WEB Gunicorn Python 3.6

- L: Linux alpine
- G: Gunicorn
- P: Python 3.6

## Usage

### ENV

- FLAG=ctfhub{gunicron_web}
- gunicorn
  - MODULE_NAME=app
  - VARIABLE_NAME=app

You should rewrite flag.sh when you use this image.
The `$FLAG` is not mandatory, but i hope you use it!

**gunicorn**

Eg:

```bash
# Flask
MODULE_NAME=app VARIABLE_NAME=app gunicorn --chdir="/app" -w 2 -b 0.0.0.0:80 -u nobody -g nogroup --access-logfile - $(MODULE_NAME):$(VARIABLE_NAME)
# as
gunicorn --chdir="/app" -w 2 -b 0.0.0.0:80 -u nobody -g nogroup --access-logfile - app:app

---

# Django
MODULE_NAME='test.wsgi' VARIABLE_NAME='application' gunicorn --chdir="/app" -w 2 -b 0.0.0.0:80 -u nobody -g nogroup --access-logfile - $(MODULE_NAME):$(VARIABLE_NAME)
# as
gunicorn --chdir="/app" -w 2 -b 0.0.0.0:80 -u nobody -g nogroup --access-logfile - test.wsgi:application

```

### Files

- src 网站源码
    + app.py
    + requirements.txt
    + ...etc
- Dockerfile
- docker-compose.yml

### Dockerfile

```
FROM ctfhub/base_web_gunicron_python_36

COPY src /app
COPY _files/flag.sh /flag.sh
```


