import { initDb } from "db/db/sequelize";
import { useRouter } from "next/router";
import { useEffect } from "react";

export default function Index ({ testAuthors }) {
  // testing next router
  const router = useRouter();
  useEffect(() => {
    router.push('/homepage');
  }, []); 

  // testing sequelize
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
