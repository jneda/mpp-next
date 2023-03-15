import Navbar from "@/components/Navbar/Navbar";
import QuoteGallery from "@/components/QuoteGallery/QuoteGallery";
import quoteView from "db/models/quoteView";
import { QuoteView } from "db/sequelize";

export default function (props) {
  if (props.error || props.quoteViews == null) {
    return <p>Une erreur est survenue... 🫢</p>;
  }

  return <QuoteGallery quoteCards={props.quoteViews} />;
}

export async function getStaticProps() {
  try {
    const quoteViews = await QuoteView.findAll();
    const processedQuoteViews = quoteViews.map((quoteView) => ({
      ...quoteView.toJSON(),
      date: quoteView.date.toString(),
    }));

    return {
      props: {
        quoteViews: processedQuoteViews,
      },
    };
  } catch (error) {
    console.log(error);

    return {
      props: {
        error: "Failed to fetch quotes from database.",
      },
    };
  }
}
