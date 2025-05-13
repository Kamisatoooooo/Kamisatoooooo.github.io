---
layout: post
title: VSCode使用SSH密钥连接服务器
author:
description: 如何使用密钥连接阿里云服务器
math: true
category:
- Blog
- Web
tags: 
- SSH
- 服务器
- 教程
image:
pin:
media_subpath: "/assets/20250209"
date: 2025-02-09 22:03 +0800
---
## 简介
本文主要介绍如何使用密钥连接阿里云服务器，官方推荐使用密钥登录。

## 环境
- 阿里云弹性云服务器(ECS)
- VSCode已安装Remote Development等插件用于连接远程服务器
- Windows 11系统已安装OpenSSH (设置->系统->可选功能->OpenSSH客户端)

## 生成密钥对
在阿里云服务器的控制台中创建密钥对, 可以自动创建或本地创建后上传.

![创建密钥对](/gen_key.png){: .w-75 style="border: 1px solid #aaa"}
_创建密钥对_

设置密钥对名称, 选择创建类型. 若选择自动创建密钥对则会自动弹出下载窗口提示下载私钥 (.pem文件) , 仅有一次下载机会.

### 本地创建密钥对后上传
也可以选择本地创建密钥对后上传

```sh
ssh-keygen -t rsa
```

参数 `-t rsa` 表示使用`rsa`算法进行加密算法, 之后会在`C:\Users\Username\.ssh\`{: .filepath} 目录下找到公钥(id_rsa.pub)和私钥(id_rsa), 将公钥上传到阿里云控制台即可.

## 使用VSCode连接服务器
### 添加服务器
接下来使用VSCode连接远程服务器, 首先如下图添加自己的服务器

![添加服务器](/ssh_connect.png){: .w-75}
_添加服务器_

在弹出的输入框中输入自己的用户名和服务器ip, 例如 `root@127.0.0.1` 并将其更新到 `C:\Users\Username\.ssh\config`{: .filepath} 文件

### 配置密钥
在VSCode中点击齿轮配置密钥

![配置密钥](/key_set.png){: .w-75}
_配置密钥_

在配置中填上 `IdentityFile` 字段, 输入刚生成的私钥的路径.

### 连接
最后点击左侧的连接图标即可连接服务器, 初次连接可能需要选择服务器的操作系统等信息

## 服务器重置后再次连接服务器
若对服务器进行了重装系统, 更换系统盘等重置等操作则需要删除本地保存的服务器指纹, 否则会重新连接. 具体为删除 `C:\Users\Username\.ssh\known_hosts`{: .filepath} 文件中的所有内容.