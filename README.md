# Next.js 스타터킷

Next.js 15 + React 19 기반 모던 웹 애플리케이션 스타터 템플릿입니다.

## 기술 스택

| 카테고리      | 기술                             | 버전   |
| ------------- | -------------------------------- | ------ |
| Framework     | Next.js (App Router + Turbopack) | 15.5.3 |
| Runtime       | React                            | 19.1.0 |
| Language      | TypeScript                       | 5      |
| Styling       | TailwindCSS                      | v4     |
| UI Components | shadcn/ui (new-york style)       | latest |
| Forms         | React Hook Form + Zod            | latest |
| Icons         | Lucide React                     | latest |
| Theme         | next-themes                      | latest |
| Linting       | ESLint + Prettier + Husky        | latest |

## 빠른 시작

> ⚠️ **폴더명 주의**: `#`, `@`, 공백 등 특수문자 사용 금지 (Turbopack CSS 오류 발생)

### A. GitHub에서 clone할 때

```bash
# 1. 저장소 복제
git clone <repository-url> my-project
cd my-project

# 2. 초기 설정 (macOS / Linux)
bash setup.sh

# 2. 초기 설정 (Windows PowerShell)
& "C:\Program Files\Git\bin\bash.exe" setup.sh

# 3. 개발 서버 실행
npm run dev
```

### B. 로컬에서 폴더 복사할 때

```powershell
# 1. 폴더 복사 (Windows PowerShell)
cp -r "원본폴더경로" "my-project"
cd my-project

# 2. git 초기화 (기존 히스토리 제거)
Remove-Item -Recurse -Force .git
git init

# 3. 초기 설정
& "C:\Program Files\Git\bin\bash.exe" setup.sh

# 4. 개발 서버 실행
npm run dev
```

```bash
# 1. 폴더 복사 (macOS / Linux)
cp -r 원본폴더경로 my-project
cd my-project

# 2. git 초기화
rm -rf .git && git init

# 3. 초기 설정
bash setup.sh

# 4. 개발 서버 실행
npm run dev
```

## 초기 설정 가이드

스타터킷을 복사한 후 필요한 설정 단계입니다.

### 필수 설정

`setup.sh` 실행 한 번으로 아래 항목이 자동 완료됩니다:

| 항목                    | 내용                                       |
| ----------------------- | ------------------------------------------ |
| `.env` 생성             | `.env.example` 기반 복사 또는 빈 파일 생성 |
| `package.json` name     | 현재 폴더명으로 자동 변경                  |
| `layout.tsx` 메타데이터 | 프로젝트 제목/설명 대화형 입력             |
| `settings.local.json`   | MCP 권한 및 에이전트 팀 설정 자동 생성     |
| shrimp-task-manager     | `DATA_DIR` 절대경로 자동 설정              |

실행 후 `.env` 파일에 필요한 환경변수를 직접 채워넣으면 됩니다.

### setup.sh 실행 방법

| 환경               | 명령어                                           |
| ------------------ | ------------------------------------------------ |
| macOS / Linux      | `bash setup.sh`                                  |
| Windows PowerShell | `& "C:\Program Files\Git\bin\bash.exe" setup.sh` |

> Git Bash가 없다면 [git-scm.com](https://git-scm.com)에서 Git을 설치하면 포함됩니다.

### Claude Code 설정

`setup.sh`가 자동으로 `.claude/settings.local.json`을 생성하며 아래 설정이 포함됩니다:

- **MCP 서버 전체 활성화**: `enableAllProjectMcpServers: true`
- **에이전트 팀 활성화**: `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`
- **자동 허용 권한**: shadcn, playwright, sequential-thinking, context7, shrimp-task-manager

## 프로젝트 구조

```
.
├── src/
│   ├── app/                    # Next.js App Router
│   │   ├── layout.tsx          # 루트 레이아웃
│   │   ├── page.tsx            # 홈 페이지
│   │   └── globals.css         # 전역 스타일
│   ├── components/
│   │   ├── layout/             # 레이아웃 컴포넌트 (Header, Footer 등)
│   │   ├── navigation/         # 네비게이션 컴포넌트
│   │   ├── providers/          # 컨텍스트 프로바이더
│   │   ├── ui/                 # shadcn/ui 컴포넌트
│   │   └── theme-toggle.tsx    # 다크모드 토글
│   └── lib/
│       └── utils.ts            # 유틸리티 함수
├── docs/
│   └── guides/                 # 개발 가이드 문서
├── public/                     # 정적 파일
├── .claude/                    # Claude Code 설정
│   ├── agents/                 # 서브에이전트 정의
│   └── commands/               # 슬래시 커맨드
├── .mcp.json                   # MCP 서버 설정
├── .env.example                # 환경변수 예시
├── setup.sh                    # 초기 설정 스크립트
└── CLAUDE.md                   # Claude Code 개발 지침
```

## 사용 가능한 명령어

| 명령어                 | 설명                       |
| ---------------------- | -------------------------- |
| `npm run dev`          | 개발 서버 실행 (Turbopack) |
| `npm run build`        | 프로덕션 빌드              |
| `npm run start`        | 프로덕션 서버 실행         |
| `npm run lint`         | ESLint 검사                |
| `npm run lint:fix`     | ESLint 자동 수정           |
| `npm run format`       | Prettier 포맷팅            |
| `npm run format:check` | Prettier 검사              |
| `npm run typecheck`    | TypeScript 타입 검사       |
| `npm run check-all`    | 모든 검사 통합 실행 (권장) |

## Claude Code 기능 가이드

### 슬래시 커맨드 (5개)

| 커맨드              | 호출 방법              | 설명                                  | 사용 예시              |
| ------------------- | ---------------------- | ------------------------------------- | ---------------------- |
| git:commit          | `/git:commit`          | 이모지 컨벤셔널 커밋 메시지 자동 생성 | 코드 수정 후 커밋할 때 |
| git:branch          | `/git:branch [이름]`   | 브랜치 생성/전환/삭제                 | 새 기능 작업 시작할 때 |
| git:pr              | `/git:pr [옵션]`       | GitHub PR 자동 생성                   | PR 올릴 때             |
| git:merge           | `/git:merge [브랜치]`  | 안전한 브랜치 병합                    | 브랜치 병합할 때       |
| docs:update-roadmap | `/docs:update-roadmap` | ROADMAP.md 진행 상황 업데이트         | 작업 완료 체크할 때    |

### 서브에이전트 (7개)

| 에이전트             | 모델   | 역할                                   | 언제 사용하나         |
| -------------------- | ------ | -------------------------------------- | --------------------- |
| code-reviewer        | sonnet | 코드 리뷰 (정확성, 성능, 보안, 가독성) | 구현 완료 후          |
| development-planner  | opus   | PRD → ROADMAP.md 생성/관리             | 프로젝트 계획 수립 시 |
| nextjs-app-developer | sonnet | Next.js App Router 구조 설계/구현      | 페이지/라우트 추가 시 |
| starter-cleaner      | sonnet | 보일러플레이트 제거, 구조 최적화       | 프로젝트 초기 정리 시 |
| ui-markup-specialist | sonnet | Tailwind + shadcn 기반 UI 마크업       | UI 컴포넌트 작업 시   |
| prd-generator        | sonnet | 1인 개발용 PRD 생성                    | 프로젝트 시작 시      |
| prd-validator        | opus   | PRD 기술적 타당성 검증                 | PRD 작성 완료 후      |

### MCP 서버 (5개)

| MCP 서버            | 용도                                  | 설치 방식  | 설정 필요 여부     |
| ------------------- | ------------------------------------- | ---------- | ------------------ |
| playwright          | 브라우저 자동화, E2E 테스트, 스크린샷 | npx (자동) | 없음               |
| context7            | 최신 라이브러리 문서 실시간 조회      | HTTP 연결  | 없음               |
| sequential-thinking | 단계별 사고 프로세스, 설계 의사결정   | npx (자동) | 없음               |
| shadcn              | shadcn/ui 컴포넌트 검색/설치/예제     | npx (자동) | 없음               |
| shrimp-task-manager | AI 작업 관리 (계획→분석→실행→검증)    | npx (자동) | DATA_DIR 경로 설정 |

### 에이전트 팀 (실험적 기능)

| 항목        | 설명                                                                  |
| ----------- | --------------------------------------------------------------------- |
| 활성화 방법 | `settings.local.json`에 `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` 추가 |
| 기능        | 여러 에이전트가 팀으로 병렬 작업 수행                                 |
| 사용 예시   | "팀을 구성해서 프론트엔드와 백엔드를 동시에 개발해줘"                 |
| 지원 도구   | TeamCreate, TeamDelete, TaskCreate, TaskUpdate, SendMessage           |

### 외부 스킬

| 스킬                      | 호출 방법                 | 설명                            |
| ------------------------- | ------------------------- | ------------------------------- |
| git-commit                | `/git-commit`             | 컨벤셔널 커밋 메시지 자동 생성  |
| deploy-check              | 배포 관련 요청 시 자동    | 배포 전 최종 점검 체크리스트    |
| nextjs-16                 | Next.js 개발 시 자동      | Next.js 16 최신 패턴 가이드     |
| lackeyjb-playwright-skill | Playwright 테스트 요청 시 | 브라우저 자동화 테스트 스크립트 |

## shadcn/ui 컴포넌트 (18개)

| 컴포넌트        | 용도                      | 추가 명령어                             |
| --------------- | ------------------------- | --------------------------------------- |
| alert           | 알림 메시지               | `npx shadcn@latest add alert`           |
| avatar          | 사용자 아바타             | `npx shadcn@latest add avatar`          |
| badge           | 뱃지/태그                 | `npx shadcn@latest add badge`           |
| button          | 버튼                      | `npx shadcn@latest add button`          |
| card            | 카드 컨테이너             | `npx shadcn@latest add card`            |
| checkbox        | 체크박스                  | `npx shadcn@latest add checkbox`        |
| dialog          | 모달 다이얼로그           | `npx shadcn@latest add dialog`          |
| dropdown-menu   | 드롭다운 메뉴             | `npx shadcn@latest add dropdown-menu`   |
| form            | 폼 래퍼 (React Hook Form) | `npx shadcn@latest add form`            |
| input           | 입력 필드                 | `npx shadcn@latest add input`           |
| label           | 레이블                    | `npx shadcn@latest add label`           |
| navigation-menu | 네비게이션 메뉴           | `npx shadcn@latest add navigation-menu` |
| progress        | 진행 바                   | `npx shadcn@latest add progress`        |
| select          | 셀렉트 박스               | `npx shadcn@latest add select`          |
| separator       | 구분선                    | `npx shadcn@latest add separator`       |
| sheet           | 사이드 패널               | `npx shadcn@latest add sheet`           |
| skeleton        | 로딩 스켈레톤             | `npx shadcn@latest add skeleton`        |
| sonner          | 토스트 알림               | `npx shadcn@latest add sonner`          |

## 라이선스

MIT
