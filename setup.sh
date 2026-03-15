#!/bin/bash
echo "🚀 Next.js 스타터킷 초기 설정을 시작합니다..."

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

# 3. 의존성 설치
npm install
echo "✅ 의존성 설치가 완료되었습니다."

# 4. 추가 설정 안내
echo ""
echo "📝 추가 설정:"
echo "  1. package.json의 name을 프로젝트명으로 변경하세요"
echo "  2. src/app/layout.tsx의 메타데이터를 수정하세요"
echo "  3. .env 파일을 편집하세요"
echo ""
echo "🎉 설정 완료! npm run dev로 개발을 시작하세요."
