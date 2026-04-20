FROM docker:latest

# 安装 Python3 和 pip
RUN apk add --no-cache python3 py3-pip

# 创建虚拟环境
RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# 升级 pip 并安装最新 runlike
RUN pip install --upgrade pip \
    && pip install runlike

ENTRYPOINT ["runlike"]
