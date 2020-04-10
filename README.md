# 基础镜像 WEB Gunicorn Python 3.6

- L: Linux alpine
- G: Gunicorn
- P: Python 3.6

## Example

[challenge_ddctf_2019_web_homebrew_event_loop_base](https://github.com/ctfhub-team/challenge_ddctf_2019_web_homebrew_event_loop_base)

## Usage

### ENV

- FLAG=ctfhub{gunicorn_web}
- gunicorn **This is used in Dockerfile(require)**
  - MODULE_NAME=app
  - VARIABLE_NAME=app
  - WORK_CLASS=gevent

You should rewrite flag.sh when you use this image.
The `$FLAG` is not mandatory, but i hope you use it!

**gunicorn**

Eg:

```bash
# Flask
MODULE_NAME=app VARIABLE_NAME=app WORK_CLASS=gevent gunicorn --chdir="/app" -w 2 -k $WORK_CLASS -b 0.0.0.0:80 -u nobody -g nogroup --access-logfile - $(MODULE_NAME):$(VARIABLE_NAME)
# as
gunicorn --chdir="/app" -w 2 -k gevent -b 0.0.0.0:80 -u nobody -g nogroup --access-logfile - app:app

---

# Django
MODULE_NAME='test.wsgi' VARIABLE_NAME='application' WORK_CLASS=gevent gunicorn --chdir="/app" -w 2 -k $WORK_CLASS -b 0.0.0.0:80 -u nobody -g nogroup --access-logfile - $(MODULE_NAME):$(VARIABLE_NAME)
# as
gunicorn --chdir="/app" -w 2 -k gevent -b 0.0.0.0:80 -u nobody -g nogroup --access-logfile - test.wsgi:application

```

### Files

- src 网站源码
    + app.py
    + requirements.txt **This is used in Dockerfile(require)**
    + ...etc
- Dockerfile
- docker-compose.yml

### Dockerfile

```
FROM ctfhub/base_web_gunicorn_python_36

ENV WORK_CLASS=gevent MODULE_NAME=app VARIABLE_NAME=app

COPY src /app
COPY _files/flag.sh /flag.sh
```


