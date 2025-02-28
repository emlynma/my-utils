# 使用最新的 Ubuntu 作为基础镜像
FROM ubuntu:latest

LABEL authors="Emlyn Ma" desc="my ubuntu with base dev kit"

# 设置环境变量以避免在安装包时出现交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 安装软件
RUN apt update && apt upgrade -y &&  \
    apt install -y sudo vim git curl openjdk-17-jdk maven openssh-server mysql-server redis-server &&  \
    apt clean

# 配置软件
RUN sed -i "s/^bind-address\s*=.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf && \
    sed -i "s/^bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf && \
    sed -i "s/^protected-mode yes/protected-mode no/" /etc/redis/redis.conf

# 创建用户
RUN useradd -m -p $(openssl passwd -1 emlyn) -s /bin/bash emlyn && usermod -aG sudo emlyn

# 拷贝文件
COPY root/ /root/
COPY emlyn/ /home/emlyn/

# 重置权限
RUN chown -R emlyn:emlyn /home/emlyn && chmod 600 /home/emlyn/.ssh/id_ed25519

# 暴露端口
EXPOSE 22 3306 6379

# 启动服务
CMD ["sh", "/root/boot.sh"]