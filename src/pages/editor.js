import { getBackgrounds } from "@/lib/getBackgrounds";
import QuoteEditor from "@/components/QuoteEditor/QuoteEditor";

export default function ({ backgrounds }) {
  console.log("Editor page client side:", backgrounds);
  return <QuoteEditor backgrounds={backgrounds} />;
}

export function getServerSideProps() {
  const backgrounds = getBackgrounds();
  console.log("Editor page server side :", backgrounds);
  return {
    props: {
      backgrounds,
    },
  };
}
