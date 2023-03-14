import Toast from '@/components/Toast/Toast'
import MessageContext from '@/context/MsgContext'
import '@/styles/globals.css'
import { Courgette } from '@next/font/google'


const courgette = Courgette({
  subsets: ['latin'],
  weight: '400'
})

export default function App({ Component, pageProps }) {

  return (
    <main>
      <MessageContext>
        <Toast />
        <Component {...pageProps} />
      </MessageContext>
    </main> 
  )
}
