# JWeb

JWeb 是一个基于Spring Boot的简单服务。提供Shell脚本，以简单的方式部署以及运行静态资源

## 快速开始

1. 下载[脚本](https://gitlab.com/JiangTJ/jweb/raw/master/scripts/jweb.sh)`repo/scripts/jweb.sh`
2. 可选：添加脚本至path目录
3. `jweb.sh -w your_static_dir`，默认`http://localhost:8080`

## 命令参数

1. -w <static-dir>   
设置静态资源路径

2. -c <config-dir>   
设置配置文件路径

3. -p <port>   
设置服务端口
