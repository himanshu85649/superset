FROM apache/superset:3.0.0

ENV SUPERSET_SECRET_KEY "import secrets; print(secrets.token_urlsafe())"
ENV FLASK_ENV production

EXPOSE 8088

CMD superset db upgrade && \
    superset init && \
    gunicorn --bind 0.0.0.0:8088 "superset.app:create_app()"
