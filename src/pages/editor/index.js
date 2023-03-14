import { seedDb } from "@/lib/getBackgrounds";
import { BgImage } from "db/sequelize";
import QuoteEditor from "@/components/QuoteEditor/QuoteEditor";

export default function ({ backgrounds }) {
  console.log("Editor page client side:", backgrounds);
  return <QuoteEditor backgrounds={backgrounds} />;
}

export async function getServerSideProps() {
  
  let backgrounds = await BgImage.findAll();
  // do we need to seed the database?
  if (backgrounds.length === 0) {
    await seedDb();
    backgrounds = await BgImage.findAll();
  }
  // make data understandable by to the front end
  backgrounds = backgrounds.map((background) => background.toJSON());


  return {
    props: {
      backgrounds,
    },
  };
}
