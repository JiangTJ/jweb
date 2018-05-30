#!/bin/sh

# export PATH=$PATH:your_dir
# Example: export PATH=$PATH:/mnt/c/Users/MrTT/IdeaProjects/jweb/scripts

# 需要openJDK
if ! hash java 2>/dev/null; then
  echo "I require java but it's not installed. Please install openJDK.";
  exit 1;
fi

# 获取脚本路径
script_path=`dirname $0`

# 修复环境
if [ ! -e ${script_path}"/jweb.jar" ]; then
  echo "Downloading jar ...";
  wget -O jweb.jar "https://gitlab.com/jiangtj/jweb/-/jobs/artifacts/release/raw/target/jweb.jar?job=build-release"
fi

# java_command
java_command="java -jar "${script_path}"/jweb.jar"

while getopts "c:p:w:" opt; do
  case ${opt} in
    c)
      config_dir=`readlink -f $OPTARG`
      java_command=${java_command}" --spring.config.location=file:"${config_dir}
      ;;
    p)
      server_port=`readlink -f $OPTARG`
      java_command=${java_command}" --server.port="${server_port}
      ;;
    w)
      static_dir=`readlink -f $OPTARG`
      java_command=${java_command}" --spring.resources.static-locations=file:"${static_dir}
      ;;
    \?)
      echo "Please read docs !"
      ;;
  esac
done

# 运行
echo ${java_command}
${java_command}
