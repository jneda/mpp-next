import QuoteGallery from "@/components/QuoteGallery/QuoteGallery";
import { initDb } from "db/db/sequelize";

export default function ({ quoteSources }) {
  // show raw data for sequelize testing purposes

  const quotes = quoteSources.map(quoteSource => <li key={quoteSource.id}>{quoteSource.content} - { quoteSource.author.name }</li>)
  // return <QuoteGallery />;
  return (
    <ul>
      {quotes}
    </ul>
  );
}

export async function getStaticProps() {
  const sequelize = await initDb();
  const QuoteSource = sequelize.models.quoteSource;
  const Author = sequelize.models.author;

  const quoteSourcesData = await QuoteSource.findAll({ include: Author });
  const quoteSources = quoteSourcesData.map(quoteSourceData => quoteSourceData.toJSON());

  return {
    props: {
      quoteSources: quoteSources
    }
  };
}