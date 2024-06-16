# 使用最新的 Ubuntu 作为基础镜像
FROM ubuntu:latest

LABEL authors="Emlyn Ma" desc="my ubuntu with base dev kit"

# 设置环境变量以避免在安装包时出现交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 安装软件
RUN apt update && apt upgrade -y &&  \
    apt install -y sudo vim git curl openjdk-17-jdk maven openssh-server &&  \
    apt clean

# 创建用户
RUN useradd -m -p $(openssl passwd -1 emlyn) -s /bin/bash emlyn && usermod -aG sudo emlyn

# 拷贝文件
COPY root/ /root/
COPY emlyn/ /home/emlyn/

# 用户配置
RUN sh /home/emlyn/init.sh && chown -R emlyn:emlyn /home/emlyn

# 暴露端口
EXPOSE 22

# 启动服务
CMD ["sh", "/root/boot.sh"]