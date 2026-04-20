FROM docker:latest

# 接收外部传入的版本号
ARG VERSION

# 安装 Python3 和 pip
RUN apk add --no-cache python3 py3-pip

# 创建虚拟环境
RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# 安全安装 runlike：
# 如果 VERSION 为空或者大于最新版本 1.5.4，就安装最新版本 1.5.4
RUN if [ -z "$VERSION" ] || [ "$(printf '%s\n' "$VERSION" "1.5.4" | sort -V | tail -n1)" != "$VERSION" ]; then \
        pip install "runlike==1.5.4"; \
    else \
        pip install "runlike==$VERSION"; \
    fi

ENTRYPOINT ["runlike"]
