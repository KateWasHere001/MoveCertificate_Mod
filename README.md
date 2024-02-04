# Move Certificates MOD

## 和原模块的异同点

### 相同点

代码全部来自 原仓库

这是一个`Magisk/KernelSU`模块 用于移动用户证书到系统证书.支持`Android 7-14`
如果手机是官方镜像,可能就需要借助`magisk`,如果是自己编译的直接`remount`手动移一下就行了.
以下是参考链接:
1. http://www.zhuoyue360.com/crack/60.html
2. https://topjohnwu.github.io/Magisk/guides.html#boot-scripts
3. https://github.com/Magisk-Modules-Repo/movecert
4. https://github.com/andyacer/movecert
5. https://book.hacktricks.xyz/v/cn/mobile-pentesting/android-app-pentesting/install-burp-certificate#android-14-zhi-hou 

### 不同点
* 从抓包工具导出 pem格式的证书文件
* 将其转换为 .0格式的证书文件
* 将转换后的证书文件推送到/data/local/tmp/cacerts/ 目录
* 模块将该目录下所有证书文件（*.0）复制到 系统证书目录

## 使用方法

### 安装本模块
Magisk\KernelSu管理器，模块--> 安装

### 制作抓包证书文件并推送到手机指定目录

以下是具体操作步骤：

1. 制作证书（如：02e06844.0）
```shell

# 格式转换（可选）
openssl x509 -in burp.der -inform der -outform pem -out cacert.pem

#openssl版本在1.0以上的版本的执行下面这一句---------------------
openssl x509 -inform PEM -subject_hash_old -in cacert.pem

#openssl版本在1.0以下的版本的执行下面这一句
openssl x509 -inform PEM -subject_hash -in cacert.pem

mv cacert.pem 02e06844.0

```
2. 创建指定目录
```shell
mkdir -p  /data/local/tmp/cacerts
```
3. 推送证书
   `adb shell push 02e06844.0 /data/local/tmp/cacerts/`

4. 重启手机
   `adb shell reboot`

## Misc

![image-20221109212126575](README.assets/image-20221109212126575.png)
