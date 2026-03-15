# 스타터킷 시작 가이드

## 1단계: 폴더 복사

스타터킷 폴더를 새 프로젝트로 복사합니다.

**⚠️ 폴더명 주의**: `#`, `@`, 공백 등 특수문자 사용 금지 (Turbopack CSS 오류 발생)

### Windows PowerShell

```powershell
# 폴더 복사
cp -r "nextjs-starter" "my-project"
cd my-project
```

### macOS / Linux

```bash
cp -r nextjs-starter my-project
cd my-project
```

---

## 2단계: git 초기화 (선택)

기존 git 히스토리를 제거하고 새로 시작할 때만 필요합니다.

### Windows PowerShell

```powershell
Remove-Item -Recurse -Force .git
git init
```

### macOS / Linux

```bash
rm -rf .git && git init
```

---

## 3단계: setup.sh 실행

의존성 설치 + `.env` + `.claude/settings.local.json` 자동 생성

### Windows PowerShell

```powershell
& "C:\Program Files\Git\bin\bash.exe" setup.sh
```

> Git Bash가 없다면 [git-scm.com](https://git-scm.com)에서 Git 설치 시 자동으로 포함됩니다.

### macOS / Linux

```bash
bash setup.sh
```

실행 결과:

```
🚀 Next.js 스타터킷 초기 설정을 시작합니다...
✅ .env 파일이 생성되었습니다.
✅ Claude Code 로컬 설정이 생성되었습니다.
✅ 의존성 설치가 완료되었습니다.
🎉 설정 완료! npm run dev로 개발을 시작하세요.
```

---

## 4단계: 프로젝트 정보 수정

```
package.json          → "name" 필드를 프로젝트명으로 변경
src/app/layout.tsx    → title, description 메타데이터 수정
.env                  → 필요한 환경변수 입력
```

---

## 5단계: 개발 서버 실행

```powershell
npm run dev
```

브라우저에서 `http://localhost:3000` 접속 → 환영 페이지가 보이면 성공

---

## 6단계: 정상 작동 확인

### 체크리스트

- [ ] `http://localhost:3000` 환영 페이지 표시
- [ ] 우측 상단 다크모드 토글 버튼 작동
- [ ] 브라우저 개발자도구(F12) → **Ctrl+Shift+M** → 모바일 크기에서 햄버거 메뉴(≡) 표시
- [ ] `npm run check-all` 오류 없이 통과

### check-all 실행

```powershell
npm run check-all
```

TypeScript + ESLint + Prettier 검사가 모두 통과하면 준비 완료입니다.

---

## 자주 발생하는 문제

### Turbopack CSS 오류

```
FileSystemPath("").join("...") leaves the filesystem root
```

**원인**: 프로젝트 폴더명에 `#` 등 특수문자 포함
**해결**: 폴더명을 `my-project`처럼 일반 이름으로 변경

### Google Fonts 경고

```
Failed to download `Geist` from Google Fonts. Using fallback font instead.
```

**원인**: 방화벽/네트워크 환경에서 Google Fonts 접근 불가
**해결**: 기능에는 문제 없음. 폴백 폰트로 자동 대체됨

### `&&` 명령어 오류 (Windows PowerShell)

```
'&&' 토큰은 이 버전에서 올바른 문 구분 기호가 아닙니다.
```

**원인**: PowerShell은 `&&` 미지원
**해결**: `;` 사용하거나 명령어를 따로 실행

```powershell
# 틀림
rm -rf .git && git init

# 맞음
Remove-Item -Recurse -Force .git
git init
```

### `bash` 명령어 없음 (Windows PowerShell)

```
'bash' 용어가 cmdlet, 함수, 스크립트 파일 또는 실행할 수 있는 프로그램 이름으로 인식되지 않습니다.
```

**해결**: `&` 연산자로 Git Bash를 직접 호출

```powershell
& "C:\Program Files\Git\bin\bash.exe" setup.sh
```
