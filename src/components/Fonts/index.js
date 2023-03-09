import { Courgette } from '@next/font/google';
import { Merriweather } from '@next/font/google';
import { Caveat } from '@next/font/google';
import { Zeyada } from '@next/font/google';
import { Great_Vibes } from '@next/font/google';

const fonts = {};

const courgette = Courgette({
    subsets: ['latin'],
    weight: '400'
  })

fonts["courgette"] = courgette;

  const GreatVibes = Great_Vibes({
    subsets: ['latin'],
    weight: '400'
  })
  
  fonts["GreatVibes"] = GreatVibes;

  const zeyada = Zeyada({
    subsets: ['latin'],
    weight: '400'
  })

  fonts["zeyada"] = zeyada;
  
  const merriweather = Merriweather({
    subsets: ['latin'],
    weight: '400'
  })

  fonts["merriweather"] = merriweather;
  
  const caveat = Caveat({
    subsets: ['latin'],
    weight: '400'
  })

  fonts["caveat"] = caveat;
  
 export default fonts;