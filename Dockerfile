FROM alpine

RUN apk add --no-cache \
        bash           \
        httpie         \
        jq &&          \
        which bash &&  \
        which http &&  \
        which jq

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY sample_push_event.json /sample_push_event.json

ENTRYPOINT ["entrypoint.sh"]

## use a python image
#FROM python:3.10
#
## set the working directory in the container to /app
#WORKDIR /app
#
## add the current directory to the container as /app
#COPY . /app
#
## pip install flask
#RUN pip install --upgrade pip && \
#    pip install Flask awscli flake8 pylint pytest pytest-flask
#
## expose the default flask port
#EXPOSE 8080
#
## execute the Flask app
#ENTRYPOINT ["python"]
#HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1
#CMD ["/app/app.py"]
