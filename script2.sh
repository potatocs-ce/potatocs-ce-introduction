# 설정할 변수들
BRANCH_NAME="park"
NUM_COMMITS=$((4 + RANDOM % 2))  # 4~5번 정도 랜덤으로 설정

# 파일 수정을 위한 변수
FILE_TO_MODIFY="path/to/your/file.txt"

# 날짜 범위 설정
START_DATE="2022-01-01T16:00:00"
END_DATE="2022-01-05T18:00:00"

# 임시 브랜치 생성 및 체크아웃
TEMP_BRANCH="temp-${BRANCH_NAME}"
git checkout -b $TEMP_BRANCH

# 반복문
for ((i=1; i<=$NUM_COMMITS; i++)); do
    # 랜덤으로 시간 생성 (16시부터 18시 사이)
    random_hour=$((16 + RANDOM % 3))
    
    # 랜덤으로 날짜 생성
    random_seconds=$((RANDOM % (3600*24*5)))  # 5일 동안의 랜덤한 초
    random_date=$(date.exe -d "@$(( $(date.exe -d "$START_DATE" +"%s") + $random_seconds ))" +"%Y-%m-%dT%H:%M:%S")

    # 주말인지 확인하고 주말이면 다시 날짜 생성
    day_of_week=$(date.exe -d "$random_date" +%u)
    if [ "$day_of_week" -ge 6 ]; then
        i=$((i-1))  # 주말이면 커밋 횟수를 줄임
        continue
    fi

    # 파일 수정
    echo "Commit $i" > "$FILE_TO_MODIFY"

    # 파일을 스테이징하고 커밋
    git add "$FILE_TO_MODIFY"
    GIT_COMMITTER_DATE="$random_date" git commit --date="$random_date" -m "Commit $i"
done

# 임시 브랜치를 원래 브랜치로 리베이스
git checkout $BRANCH_NAME
git rebase $TEMP_BRANCH

# 임시 브랜치 삭제
git branch -d $TEMP_BRANCH
