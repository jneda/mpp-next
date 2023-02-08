import { initDb } from "db/db/sequelize";

export default function ({ testAuthors }) {
  const authors = testAuthors.map(author => <li key={author.id}>{author.name}</li>);

  return (
    <>
      <main>
        <ul>
          {authors}
        </ul>
      </main>
    </>
  );
}

export async function getStaticProps() {
  const sequelize = await initDb();

  const Author = sequelize.models.author;
  
  let testAuthors = await Author.findAll();
  sequelize.close();

  testAuthors = testAuthors.map(author => author.toJSON())

  console.log(testAuthors);
  return {
    props: {
      testAuthors: testAuthors,
    }
  };
}
