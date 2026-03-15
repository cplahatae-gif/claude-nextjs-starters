#!/bin/bash
echo "🚀 Next.js 스타터킷 초기 설정을 시작합니다..."

# 현재 폴더명을 프로젝트명으로 사용
PROJECT_NAME=$(basename "$PWD")

# 1. .env 파일 생성
if [ ! -f .env ]; then
  if [ -f .env.example ]; then
    cp .env.example .env
    echo "✅ .env 파일이 생성되었습니다."
  else
    echo "⚠️  .env.example 파일이 없습니다. .env 파일을 수동으로 생성하세요."
  fi
else
  echo "ℹ️  .env 파일이 이미 존재합니다."
fi

# 2. Claude Code 로컬 설정 생성
if [ ! -f .claude/settings.local.json ]; then
  cat > .claude/settings.local.json << 'EOF'
{
  "permissions": {
    "allow": [
      "Read",
      "Bash",
      "mcp__shadcn",
      "mcp__playwright",
      "mcp__sequential-thinking",
      "mcp__context7__resolve-library-id",
      "mcp__context7__query-docs"
    ],
    "deny": [],
    "ask": []
  },
  "enableAllProjectMcpServers": true,
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}
EOF
  echo "✅ Claude Code 로컬 설정이 생성되었습니다."
else
  echo "ℹ️  Claude Code 로컬 설정이 이미 존재합니다."
fi

# 3. package.json name을 폴더명으로 자동 변경
if [ -f package.json ]; then
  sed -i "s/\"name\": \".*\"/\"name\": \"$PROJECT_NAME\"/" package.json
  echo "✅ package.json name이 '$PROJECT_NAME'으로 설정되었습니다."
fi

# 4. 프로젝트 메타데이터 입력
echo ""
read -p "📝 프로젝트 제목을 입력하세요 (Enter로 기본값 사용: '$PROJECT_NAME'): " PROJECT_TITLE
PROJECT_TITLE=${PROJECT_TITLE:-$PROJECT_NAME}

read -p "📝 프로젝트 설명을 입력하세요 (Enter로 기본값 사용: '$PROJECT_NAME 웹 애플리케이션'): " PROJECT_DESC
PROJECT_DESC=${PROJECT_DESC:-"$PROJECT_NAME 웹 애플리케이션"}

# layout.tsx metadata 블록 교체 (node.js 사용으로 멀티라인 안전 처리)
if [ -f src/app/layout.tsx ]; then
  PROJECT_TITLE="$PROJECT_TITLE" PROJECT_DESC="$PROJECT_DESC" node -e "
const fs = require('fs');
const title = process.env.PROJECT_TITLE;
const desc = process.env.PROJECT_DESC;
const content = fs.readFileSync('src/app/layout.tsx', 'utf8');
const updated = content.replace(
  /export const metadata: Metadata = \{[\s\S]*?\}/,
  'export const metadata: Metadata = {\n  title: \'' + title + '\',\n  description: \'' + desc + '\',\n}'
);
fs.writeFileSync('src/app/layout.tsx', updated);
"
  echo "✅ layout.tsx 메타데이터가 설정되었습니다. (제목: $PROJECT_TITLE)"
fi

# 5. 의존성 설치
echo ""
npm install
echo "✅ 의존성 설치가 완료되었습니다."

# 6. 추가 설정 안내
echo ""
echo "📝 추가 설정:"
echo "  1. .env 파일을 편집하세요"
echo ""
echo "🎉 설정 완료! npm run dev로 개발을 시작하세요."
