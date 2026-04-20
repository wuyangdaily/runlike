FROM docker:latest

ARG VERSION

RUN apk add --no-cache python3 py3-pip

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# 安全安装 runlike，VERSION 为空就安装最新 fallback
RUN if [ -n "$VERSION" ]; then \
        pip install "runlike==$VERSION" || pip install runlike==1.5.4; \
    else \
        pip install runlike==1.5.4; \
    fi

ENTRYPOINT ["runlike"]
