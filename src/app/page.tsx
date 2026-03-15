import { Footer } from '@/components/layout/footer'
import { Header } from '@/components/layout/header'
import { Button } from '@/components/ui/button'
import Link from 'next/link'

export default function Home() {
  return (
    <div className="flex min-h-screen flex-col">
      <Header />
      <main className="flex flex-1 flex-col items-center justify-center gap-8 px-4 text-center">
        <div className="space-y-4">
          <h1 className="text-4xl font-bold tracking-tight sm:text-5xl">
            Next.js 스타터킷
          </h1>
          <p className="text-muted-foreground mx-auto max-w-xl text-lg">
            Next.js 15 + React 19 + TypeScript + TailwindCSS v4 + shadcn/ui로
            구성된 모던 웹 애플리케이션 스타터 템플릿입니다.
          </p>
        </div>
        <div className="flex gap-4">
          <Link href="https://github.com" target="_blank">
            <Button>시작하기</Button>
          </Link>
          <Link href="https://nextjs.org/docs" target="_blank">
            <Button variant="outline">문서 보기</Button>
          </Link>
        </div>
      </main>
      <Footer />
    </div>
  )
}
