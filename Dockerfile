# 使用官方 Python 镜像作为基础镜像
FROM python:3.9-slim AS base

# 设置工作目录
WORKDIR /app

# 复制 requirements.txt 并安装依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制应用程序代码
COPY app.py .
COPY config/ ./config/
#COPY hls/ ./hls/

# 暴露 Flask 应用程序的端口
EXPOSE 50086

# 设置环境变量
ENV FLASK_APP=app.py

# 启动 Flask 应用程序
CMD ["flask", "run", "--host=0.0.0.0"]


#EXPOSE 50086
#CMD ["python", "app.py"]
