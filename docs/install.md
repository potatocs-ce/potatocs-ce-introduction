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

#### 1.4 Docker desktop 다운로드

<https://www.docker.com/products/docker-desktop/>

#### 1.5 Docker Image 다운로드

```sh
# wsl2 우분투에서
# mongodb binding 경로 생성
$ mkdir ~/mongodb && mkdir ~/mongodb/data

# 몽고디비 이미지 설치
$ docker pull mongo

# 도커로 몽고디비 실행
$ docker run --name mongodb -v ~/mongodb/data:/data/db -d -p 27017:27017 mongo


```

---

## 2. 포테이톡스 커뮤니티 설치

```sh
# 포테이톡스 협업 클라이언트
$ git clone https://github.com/NSMARTS/potatocs-collab-client-community.git

# 포테이톡스 협업 서버
$ git clone https://github.com/NSMARTS/potatocs-collab-server-community.git

# 포테이톡스 미팅 클라이언트
$ git clone https://github.com/NSMARTS/potatocs-meeting-client-community.git

# 포테이톡스 미팅 서버
$ git clone https://github.com/NSMARTS/potatocs-meeting-server-community.git
```

---

## 3. 환경변수 설정

#### 3.1 포테이톡스 협업서버 환경변수 설정

```sh
# 포테이톡스 협업 서버로 이동
cd potatocs-collab-server-community

# env 파일 생성
mkdir env && vi env/dev.env

# vi 편집기에서 'i' 누른 후 아래 내용 복사 + 붙여넣기. 저장 후 종료 esc wq!
-----------------------------------------------
# Mode
MODE = 'Development Mode'

# Token
JWT_SECRET = 'coop'

# Mongo DB URL
MONGODB_URI='mongodb://localhost:27017/?retryWrites=true&w=majority'

# VERSION
VERSION = '0.2'

# PORT
PORT = 3300

# S3 Config
AWS_ACCESS_KEY = 'Your S3 ACCESS_KEY'
AWS_SECRET_ACCESS_KEY = 'Your S3_SECRET_ACCESS_KEY'
AWS_REGION = 'Your_S3_REGION'

# S3 Bucket Name
AWS_S3_BUCKET = 'Your_S3_BUCKET'

# SES Config
AWS_SES_ACCESS_KEY = 'Your SES ACCESS_KEY'
AWS_SES_SECRET_ACCESS_KEY = 'Your SES SECRET_ACCESS_KEY'
AWS_SES_REGION = 'Your SES_REGION'

# Node Mailer
POTATOCS_URL = 'Your_URL'

# White Board Canvas Drawing Recording File
whiteBoardFolderName = '/uploads/white_board'
-----------------------------------------------
```

#### 3.2 포테이톡스 미팅서버 환경변수 설정

```sh
# 포테이톡스 미팅 서버로 이동
cd ../potatocs-meeting-server-community

# env 파일 생성
mkdir env && vi env/dev.env

# ssl 폴더생성
mkdir ssl

# cert.pem 폴더 생성
-----BEGIN CERTIFICATE-----
MIICAzCCAWwCCQDUB0G6UpqG9DANBgkqhkiG9w0BAQsFADBFMQswCQYDVQQGEwJB
VTETMBEGA1UECAwKU29tZS1TdGF0ZTEhMB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0
cyBQdHkgTHRkMCAXDTIwMDUwMzE1MjA0MloYDzIyOTQwMjE2MTUyMDQyWjBFMQsw
CQYDVQQGEwJBVTETMBEGA1UECAwKU29tZS1TdGF0ZTEhMB8GA1UECgwYSW50ZXJu
ZXQgV2lkZ2l0cyBQdHkgTHRkMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1
NxC8z2k7jEQkF0YkuOSqCBtc4dsb+RgPSkXu6NFMf8g59Sg7EBK29ledRlrszF1j
9ztpgvZCy2PwpJCWu5efCacifRpDege2fPACDre/v04vWfRCzQzgwu21kM9tBPyf
VZlM1Z5tjcbmAKrE8/DSMWxgiBP/o343UpZkQ5VLYQIDAQABMA0GCSqGSIb3DQEB
CwUAA4GBAK+uEcDRU4BnLkr47TZ4mYm7F9h2OXAqf/9FXrH6iwBqiVenG9j8GHop
lLZ0uAkTGUkSKlqe7imaRogKOKWzB89BTl4M3NqheeIlR5rgb8T6h73CIZViVdyF
nid/BTSwWY3eu9qeIL6tLf4977ExfIUZCVlL739pasTx6wXQ1h5i
-----END CERTIFICATE-----

# key.pem 추가
-----BEGIN RSA PRIVATE KEY-----
MIICXwIBAAKBgQC1NxC8z2k7jEQkF0YkuOSqCBtc4dsb+RgPSkXu6NFMf8g59Sg7
EBK29ledRlrszF1j9ztpgvZCy2PwpJCWu5efCacifRpDege2fPACDre/v04vWfRC
zQzgwu21kM9tBPyfVZlM1Z5tjcbmAKrE8/DSMWxgiBP/o343UpZkQ5VLYQIDAQAB
AoGBAKdQplWOM51Vjvy7uHnjdM1BGvKRXlrfjMVhUFyb/dNiEB7jKjgOSRlBLff6
o60LrBbGiMaMso9Nd4MSjqV9oykYQ3zhdSV/W8W7nA5OhXzgJF4cngkrwnxWhLYA
mqH8GJWCvz7/7A8Ckeutx8Zn1GTJWcd/CfSd9SDNGAJqJA4BAkEA3RYhdATWwjhZ
KsWwFMVzG7fBqCvJLO/Ep9kIvpLtiaQjyNtftS8Nw91IpEVodTAtxxiVBiFRiFxS
3yTWVUOEsQJBANHVDejleEYvT/Rc7aN0bhJVcZuhaN9qPDIXY5UIQTYR1NzgcQKA
qCo7u0x0+vQiYJ15YqrRo8ZkdqvyCNlmnbECQQC2KrYF0rbh8WwHQjyD4O2nuRFo
cCujSyzO4JXD8WyoLQcPSTLjJ5JAAOUJ9ebMKJaPpkGke2+i2++szb2NI8UBAkEA
kKoBmAK0hDbUOdXjpGB+DrfHxpNmmTlF3QcRCcuSIfPzPICkiSQoTE24GMNBzRTy
ZT8tzjUQY5QZ2PvaLAA6UQJBAJXLnYMIX0ZkO1nG6mMIWoZtrLpfg+pSFa0VUsHs
7G3iYf9v31Wd6HipMRzg/q63m90nwI5emTYe+EEo4lkGnz8=
-----END RSA PRIVATE KEY-----

# meeting 서버의 config.js 부분 내용 확인

# vi 편집기에서 'i' 누른 후 아래 내용 복사 + 붙여넣기. 저장 후 종료 esc wq!
-----------------------------------------------
#    DEVELOPMENT MODE
MODE = 'Development Mode'

# Token
JWT_SECRET = 'coop'

# Mongo DB URL
MONGODB_URI='mongodb://localhost:27017/?directConnection=true?retryWrites=true&w=majority'

# PORT
PORT = 3400

# VERSION
VERSION = '0.0.1'


# S3 Config
AWS_ACCESS_KEY = 'Your S3 ACCESS_KEY'
AWS_SECRET_ACCESS_KEY = 'Your S3_SECRET_ACCESS_KEY'
AWS_REGION = 'Your_S3_REGION'

# S3 Bucket Name
AWS_S3_BUCKET = 'Your_S3_BUCKET'
-----------------------------------------------
```

---

## 4. 포테이톡스 실행

```sh
# 터미널 첫번째 탭에서 실행
cd potatocs-collab-client-community
npm i
npm start

# 터미널 두번째 탭에서 실행
cd potatocs-collab-server-community
npm i
npm run linux-test

# 터미널 세번째 탭에서 실행
cd potatocs-meeting-client-community
npm i
npm start

# 터미널 네번째 탭에서 실행
cd potatocs-meeting-server-community
npm i
npm run linux-test
```

---

## 5. 문의사항

궁금하거나 문의사항이 있을 경우, ce.potatocs@gmail.com 으로 연락주시길 바랍니다.
