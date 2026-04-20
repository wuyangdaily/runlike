FROM docker:latest

# 接收外部传入的版本号
ARG VERSION

# 安装 Python3 和 pip
RUN apk add --no-cache python3 py3-pip

# 创建虚拟环境
RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# 安全安装 runlike，如果 VERSION 为空就安装最新版本
RUN if [ -n "$VERSION" ]; then \
        pip install "runlike==$VERSION"; \
    else \
        pip install runlike; \
    fi

ENTRYPOINT ["runlike"]
