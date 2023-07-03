# Getting started - install

---

## 목차

[1. 요구사항](#1) <br>
[2. 포테이톡스 커뮤니티 설치](#2) <br>
[3. 환경변수 설정](#3) <br>
[4. 포테이톡스 실행](#4) <br>
[5. 문의사항](#5) <br>

## <!-- -   `mkdocs new [dir-name]` - Create a new project. -->

## 1. 요구사항

|       이름       |                 버전                 |
| :--------------: | :----------------------------------: |
| Windows terminal |   v 1.17.11 \* Mac OS 시 필요 없음   |
|       wsl2       | Unbuntu 22.04 \* Mac OS 시 필요 없음 |
|       node       |                 v 16                 |
|  Docker Desktop  |             v 4.21.0 lts             |
|       git        |               v 2.41.0               |
| AWS S3 , SES KEY |    AWS S3 , SES 사용에 필요한 Key    |

#### 1.1 windows terminal 설치

<https://learn.microsoft.com/ko-kr/windows/terminal/install>

#### 1.2 wsl2 설치법

<https://learn.microsoft.com/ko-kr/windows/wsl/install-manual>

관리자 모드로 PowerShell 실행

```sh

# Linux용 Windows 하위시스템 사용
$ dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Virtual Machine 기능 사용
$ dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# https://learn.microsoft.com/ko-kr/windows/wsl/install-manualdptj
# MS STORE 에서 리눅스 커널 업데이트 패키지 다운 !!!

# 리눅스 커널 업데이트 패키지 다운 후 재부팅.
# 관리자모드 Powershell에서 wsl2 로 전환
$ wsl --set-default-version 2

# MS STORE에서 Ubuntu 22.04 lts 설치
# https://apps.microsoft.com/store/detail/ubuntu-22042-lts/9PN20MSR04DW?hl=ko-kr&gl=kr&rtc=1
# 에서 설치 후 ubuntu 사용자 계정 / 비밀번호 등록
```

#### 1.3 node/ nvm 설치

<https://github.com/nvm-sh/nvm>

```sh
# wsl2 설치 후 우분투 환경에 nvm 설치
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
$ source ~/.bashrc
$ nvm install v16
$ nvm alias default v16
```
