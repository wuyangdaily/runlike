FROM docker:latest

ARG VERSION

RUN apk add --no-cache python3 py3-pip

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# 安全安装 runlike，如果 VERSION 超过 PyPI 最新版本或不存在就安装最新
RUN pip install --upgrade pip setuptools wheel && \
    if [ -n "$VERSION" ]; then \
        pip install "runlike==$VERSION" || pip install runlike; \
    else \
        pip install runlike; \
    fi

ENTRYPOINT ["runlike"]
