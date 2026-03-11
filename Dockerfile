# 使用官方Python镜像，它包含了编译所需的所有工具
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 复制依赖文件并安装（此时可以在容器内安全地使用apt-get）
COPY requirements.txt .
RUN apt-get update && apt-get install -y gcc python3-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get clean

# 复制所有项目文件
COPY . .

# 声明服务端口（Render会自动映射）
EXPOSE 8080

# 启动命令
CMD ["python", "app.py"]
