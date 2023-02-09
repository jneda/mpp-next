import { Author } from "db/sequelize";

export default function ({ testAuthors }) {
  const authors = testAuthors.map(author => <li key={author.id}>{author.name}</li>);
  console.log(authors);

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

  let testAuthors = await Author.findAll();

  testAuthors = testAuthors.map(author => author.toJSON())
  
  return {
    props: {
      testAuthors: testAuthors,
    }
  };
}
