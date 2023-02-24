import '@/styles/globals.css'
import { Courgette } from '@next/font/google'


const courgette = Courgette({
  subsets: ['latin'],
  weight: '400'
})

export default function App({ Component, pageProps }) {
  return (
  <main>
    <Component {...pageProps} />
  </main>
)}
