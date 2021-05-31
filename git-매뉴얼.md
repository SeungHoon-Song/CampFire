---
layout: post
title:  "Git Branch 사용 & 병합하기 / Git merge 병합하기 매뉴얼"
date: 2021-05-28 13:00:21 +0900
categories: git
---

참고 사이트 [Git Branch 사용 & 병합(merge)하기 / Conflict 해결하기](https://iu-corner.tistory.com/entry/Git-Branch-사용-병합하기)



---

------
# 풀 리퀘스트 (Git Pull Request 병합 요청)

## 1. Fork  
  
- 타겟 프로젝트의 저장소를 자신의 저장소로 Fork 한다.
![image](https://user-images.githubusercontent.com/68332735/119927963-8538a580-bfb5-11eb-8e70-28c07ccf993e.png)

포크(Fork)가 완료되면 자신의 계정에 새로운 저장소가 생긴다.

------
  
## 2. clone, remote 설정

- fork로 생성한 본인 계정의 저장소에서 **clone or download** 버튼을 누르고 표시되는 url을 복사한다. (중요 - 브라우저 url을 그냥 복사하면 안 된다)
- ![image](https://user-images.githubusercontent.com/68332735/119933893-e6657680-bfbf-11eb-8a32-41956af08acf.png)

- 자신의 컴퓨터에서 작업을 하기 위해서 Fork한 저장소를 로컬에 clone 한다.


```
git clone https://github.com/자신의계정/campfire.git
```



- 로컬 저장소에 원격 저장소를 추가한다. 위 작업과 동일하게 github 저장소에서 clone or download 메뉴를 통해서 확인한 URL을 사용한다. 
  - 원본 프로젝트 저장소 (직접 추가 )
  - fork한 로컬 프로젝트 (origin 이라는 별명으로 기본으로 추가되어 있다. 따로 추가할 필요가 없음)

```shell
# 원본 프로젝트 저장소를 원격 저장소로 추가
git remote add origin https://github.com/원본계정/campfire.git

# 원격 저장소 설정 현황 확인 방법
git remote -v
```

---

브랜치 생성 및 checkout 브랜치 변경 -> 수정 후 add , commit , push  (아래 브랜치 설명서 참고)

---  

## 3. Pull Request 생성 
- push 완료 후 본인 계정의 github 저장소에 들어오면 Compare & pull reqeust 버튼이 활성화 되어 있다.  
- 해당 버튼을 선택하여 메시지를 작성하고 PR을 생성한다.

<img width="965" alt="KakaoTalk_Photo_2021-05-28-14-26-42" src="https://user-images.githubusercontent.com/68332735/119934463-c6828280-bfc0-11eb-9d67-718548c5da21.png">

깃허브 원격 저장소에 가서 자신의 브랜치로 설정 후 Pull Request 버튼을 클릭한다.


<img width="959" alt="KakaoTalk_Photo_2021-05-28-14-26-48" src="https://user-images.githubusercontent.com/68332735/119934466-c7b3af80-bfc0-11eb-9997-7183cc0a6e27.png">


제목과 내용을 작성한 뒤 병합 요청(Create Pull Request)

---



# Git Branch 사용 & 병합하기



![img](https://blog.kakaocdn.net/dn/5WVI1/btqKC959HKv/iNdTGEFKuFygShxWNTM4a1/img.jpg)

※ Branch란?

\- Software개발시 개발자들은 동일한 소스코드 위에서 신규 개발, 버그 수정 등의 업무를 협업하곤 한다. 이럴 때, 여러 개발자들이 동시에 다양한 작업을 할 수 있게 만들어 주는 기능이 "Branch" 이다.

즉, 브랜치(Branch)를 통해 하나의 프로젝트를 여러 갈래로 나누어서 관리할 수 있다. 각각의 독립된 Branch에서 마음대로 소스코드를 변경하여 작업 한 후 원래 버전과 비교하여 또 하나의 새로운 버전을 만들어 낼 수 있다.



---

## ➡ 1. Branch 확인 하기



#### 1) 현재 내가 위치한 Branch 확인

```
$ git branch
```

![img](https://blog.kakaocdn.net/dn/PfAlx/btq4XfAgp3P/qgu0nrJA2DYQ9KdS1jsFCk/img.png)

![img](https://blog.kakaocdn.net/dn/bHGd1F/btq4YKGybIR/NInypIbAwF528tFBNkDPbK/img.png)



\- 현재는 master 브랜치만 존재 한다. (master :최초 레포지토리 생성후 커밋하면 자동으로 생기는 브랜치)

\- \*가 붙어있는 브랜치가 현재 활성화된 브랜치이다.



```
$ git status
```

![img](https://blog.kakaocdn.net/dn/WjZRN/btq433SoNPt/quK0tnK2x7TQykhnvhsuJK/img.png)

\- On branch master > 마스터 브랜치 위에 있다.



#### 2) 원격 저장소의 Branch 확인

```
$ git branch -r
```

![img](https://blog.kakaocdn.net/dn/r0uRS/btq44bWYUwu/EaSQEzgRJDBxNTxS4mnEm1/img.png)



#### 3) 브랜치의 마지막 커밋 메세지 확인

```
$ git branch -v
```

![img](https://blog.kakaocdn.net/dn/bbjOAw/btqKxQT1Tsw/fumirxB2fUA4Q2kJjyYL0k/img.png)



---

## ➡ 2. Branch 생성 및 이동



#### 2.1 첫번째 방법



1) Branch 생성

```
git branch 브랜치명
```

2) 생성한 Branch로 이동하기

```
git checkout 브랜치명
```

![img](https://blog.kakaocdn.net/dn/c7W2UX/btq4XD8LZfL/muaQzdoDnKjT62YgiTetCk/img.png)



#### 2.2 두번째 방법



1) checkout 옵션 중 `-b`를 사용하여, 생성 후 바로 이동

`git checkout -b 브랜치명`

```
git checkout -b c
```

---

## ➡ 3. Branch 삭제



#### 1) git branch -d 브랜치명

```
$ git branch -d test
```

---

## ➡ 4. 생성한 Branch를 원격 저장소(Repository)에 푸쉬(Push)하기



#### 1) 생성한 Branch로 이동



`git checkout test`

-   현재 원격 저장소에는 master branch밖에 없는 상태이고, test branch로 이동하여 push를 그대로 한다면 오류가 발생한다.
-   로컬 레포지토리를 리모트 레포지토리로 처음 push할 때는 --set-upstream 옵션을 주어야 한다.
-   그래야 tracking 정보 설정이 되어 git push만 사용해도 푸쉬가 된다.

```
$ git push --set-upstream origin 브랜치명(test)
```

or

```
$ git push -u origin 브랜치명(test)
```

---

# Git Branch(2) - 브랜치 병합하기



## ➡ 1. Git Merge



#### 1) 신규 생성한 branch로 이동하기

`git checkout c`

`git branch`



#### 2) c 브랜치에서 다음과 같은 파일을 하나 생성한다.

파일명 : `test.txt`

command Line : `vi test.txt` -> `test text`

![img](https://blog.kakaocdn.net/dn/kY6vZ/btq4Yjbnduj/sq5Ua2EcMMGsjNM479esK1/img.png)



#### 3) 신규 txt 파일 커밋

`git add .`

`git status`

`git commit -m "add test txt"`

![img](https://blog.kakaocdn.net/dn/olxgy/btq4XXzC8BU/eCvdN9KcMImhkJnGf6CuAk/img.png)



 \- c 브랜치에 신규 txt 파일이 추가 되었고 충분히 테스트 되어 문제가 없다는 가정하에 master 브랜치에도 똑같은 txt 파일을 생성 하려 한다.
이때 내가 작성한 파일을 master branch로 이동하여 그대로 작성해도 되지만, merge 기능을 사용하여 c 브랜치에서 합칠 수 있다.



#### 4) master branch로 이동

`git checkout master`

`ll`

![img](https://blog.kakaocdn.net/dn/bEhtre/btq4ZgxZlas/asmiDIbvUsJHBKobWV1Yc1/img.png)



#### 5) c브랜치에서 작업하였던 파일을 master 브랜치로 병합 해본다.

command Line : `git merge 브랜치명`

```shell
git merge c
```



![img](https://blog.kakaocdn.net/dn/bI3jZT/btq4Zf6VE9z/1f48ssdO40yyY2baidW5IK/img.png)

- `c` 브랜치에서 했던 작업 내용이 복사된 것을 볼 수 있다. 즉, 다른 브랜치에서 했던 작업 내용을 가져오고 싶을 때 merge를 사용할 수 있다.





---



## ➡ Git Conflict(컨플릭트) 상황 해결 하기

컨플릭트 : 충돌

#### 1) c 브랜치로 이동

\- 임의로 간단한 소스 충돌 상황을 만든다.

```
git checkout c
```

####  

#### 2) 텍스트 내용을 변경 (c 브랜치에서)

\- 메모장 또는 vi 편집기를 이용하여 다음과 같이 이름을 변경해본다.

![img](https://blog.kakaocdn.net/dn/opoLD/btq4XfNRFs3/vupgSMTRQYSDVDrfAHVYm0/img.png)

![img](https://blog.kakaocdn.net/dn/uAt82/btq44cawmna/41L9spy2b36k2s98MCbKQk/img.png)



#### 3) 수정한 내용 커밋

```
git add .
git commit -m "change test text.txt"
```

![img](https://blog.kakaocdn.net/dn/uF2fm/btq4YtxODBe/5J4Ufx6ix2OlhpW9NSCJ30/img.png)

이 후 master 브랜치로 이동한다.

```
git checkout master
```

####  

#### 4) 파일 확인

\- 당연히 master branch로 확인해보면 c 브랜치에서 수정한 내용은 반영되어있지 않다.

```
cat test.txt
```

![img](https://blog.kakaocdn.net/dn/bMajds/btq4544nbVs/LZPBAw2U1aRkrvQB7kCxL1/img.png)



#### 5) 함수 이름을 변경 (master 브랜치)

\- 메모장 또는 vi 편집기를 활용하여 다음과 같이 내용을 변경하고, 커밋한다.

![img](https://blog.kakaocdn.net/dn/bvOUPf/btq4ZRyrtI7/FLNTi3YxhGixEpIkoBKY41/img.png)

![img](https://blog.kakaocdn.net/dn/bYY2pC/btq4XDVc9Hd/3qGBnLbUOddBp5z29VZ241/img.png)



#### 6) branch 병합

\- 머지(merge) 작업을 해본다.

```
git merge c
```

-> 메세지를 살펴보면 영어 버전인 경우 CONFLICT라는 단어가 포함되어 있을 것이다. 충돌이 발생한 것이다.

![img](https://blog.kakaocdn.net/dn/JptO6/btq4ZRLYhUU/u72bzR5nzf6LJ15YAtoB01/img.png)

그럼 컨플릭트 상황이 발생하였다고 나와있는 파일을 살펴 본다.

command Line : vi test.txt

![img](https://blog.kakaocdn.net/dn/daljZT/btq454pMa21/XgMm0kbVk6uzbiTglXvkpk/img.png)

 \- "=======" 을 기준으로

  위 : HEAD로 표시되어 있는 내용이 master 브랜치에서 한 작업

  아래 : test로 표시되어 있는 내용은 test 브랜치에서 한 작업

 \- 각각의 브랜치에서 동일한 파일을 수정하였는데, merge를 하려고 했을때 git이 어떤 내용이 맞는지 판단할 수 없기 때문에 충돌이 발생하였다고 알려 준다. 
이런 상황을 Conflict가 발생하였다고 한다.



### 7) Conflict (충돌) 해결하기﻿

#### 7.1) 직접 수정 

\- 직접 양 브랜치간의 내용을 비교하여 수정 후 add, commit 처리 한다.

ex) vi test.txt 하여  '<<<<<<<<  HEAD ' , ' >>>>>>>> 브랜치명 ' 까지 지운 뒤 ' merge text test '로 변경 후 커밋 처리



#### 7.3) 머지(merge) 작업 취소﻿

\- 머지를 하다가 conflict가 발생하였을 때, 일단은 merge 작업을 취소하고 이전 상태로 되돌아 갈 수 있다.

Command Line :

```
git merge --abort
```



![img](https://blog.kakaocdn.net/dn/b49vJs/btq4335XSNk/oN1n4jAayt396PscoVmcz1/img.png)

머지 시도 이전 파일내용과 똑같은 것을 볼 수 있다.

이 후 작업을 다시 하고 병합하거나, 아니면 c 브랜치의 내용으로 그냥 merge처리 하는 등의 선택을 할 수 있다.



----



# Git - 수정한 것 되돌리기

### 1. git add 명령을 하기 이전(stage에 올리지 않은 경우)

#### 1.1 repository 내 모든 수정 되돌리기

```
$ cd {repository_root_dir}
$ git checkout .
```

#### 1.2 특정 폴더 아래의 모든 수정 되돌리기

```
$ git checkout {dir}
```

#### 1.3 특정 파일의 수정 되돌리기

```
$ git checkout {file_name}
```

### 2. git add 명령으로 stage에 올린 경우

```
$ git reset
```

### 3. git commit을 한 경우

#### 3.1 commit 내용을 없애고 이전 상태로 원복

master 브랜치의 마지막 커밋을 가리키던 HEAD를 그 이전으로 이동시켜서 commit 내용을 없앰

```
$ git reset --hard HEAD^
```

#### 3.2 commit은 취소하고 commit 했던 내용은 남기고 unstaged 상태로 만들기

```
$ git reset HEAD^
```

#### 3.3 commit은 취소하고 commit 했던 내용은 남기고 staged 상태로 만들기

```
$ git reset --soft HEAD^
```

### 4. 모든 untracked 파일들을 지우기

```
git clean -fdx
```

### 5. git push를 한 경우 remote repository도 이전으로 되돌리기

```
$ git reset HEAD^  #local repository에서 commit을 하나 되돌림
$ git commit -m "..."  #되돌린 것으로 commit
$ git push origin +master #remote repository를 강제로 revert
```


