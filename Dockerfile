# Dockerfile
FROM python:3.10-slim

# 安装 websockify 和 git（用于拉取 noVNC）
RUN pip install websockify && \
    apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/novnc/noVNC.git /root/noVNC && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /root

# 暴露 websockify 端口
EXPOSE 6080

# 默认启动命令（可以覆盖）
CMD ["websockify", "--web=/root/noVNC", "6080", "oci-helper:5900"]