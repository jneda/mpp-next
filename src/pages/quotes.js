import Navbar from "@/components/Navbar/Navbar";
import QuoteGallery from "@/components/QuoteGallery/QuoteGallery";
import { Author, QuoteSource } from "db/sequelize";

export default function ({ quoteSources }) {
  // show raw data for sequelize testing purposes

  const quotes = quoteSources.map(quoteSource => <li key={quoteSource.id}>{quoteSource.content} - {quoteSource.author.name}</li>);
  // return <QuoteGallery />;
  return (
    <>
      <ul>
        {quotes}
      </ul>
      <Navbar page="quotes" />
    </>
  );
}

export async function getStaticProps() {

  const quoteSourcesData = await QuoteSource.findAll({ include: Author });
  const quoteSources = quoteSourcesData.map(quoteSourceData => quoteSourceData.toJSON());

  return {
    props: {
      quoteSources: quoteSources
    }
  };
}
