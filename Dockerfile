FROM alpine:latest

ARG VERSION

RUN apk add --no-cache docker-cli python3 py3-pip

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

RUN if pip install "runlike==$VERSION" 2>/dev/null; then \
        echo "Installed runlike==$VERSION"; \
    else \
        echo "Version $VERSION not found, falling back to 1.5.4"; \
        pip install runlike==1.5.4; \
    fi

ENTRYPOINT ["runlike"]
